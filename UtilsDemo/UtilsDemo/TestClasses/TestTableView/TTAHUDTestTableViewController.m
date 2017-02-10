//
//  TTAHUDTestTableViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 09/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTAHUDTestTableViewController.h"
#import "TTAHUD.h"

@interface TTAHUDTestTableViewController ()

@end

@implementation TTAHUDTestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setupUI {
    [super setupUI];
    self.title = @"TTAHUD";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData {
    NSArray *items = @[@[@"loading", @"loadingMessage", @"loadingMessageInView", @"loadingMessageDelay"], @[@"stopLoading", @"stopLoadingMessage", @"stopLoadingMessageDelay"], @[@"tipMessage", @"tipMessageDelay", @"tipMessageDelayCompletion"]];
    [_baseArrayDataSource setHeaderTitles:@[@"loading", @"stopLoading", @"tipMessage"]];
    [_baseArrayDataSource setView:_tableView withGroups:items];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString * msg = [_baseArrayDataSource itemAtIndexPath:indexPath];
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    switch (section) {
        case 0: {
            switch (row) {
                case 0:
                    [[TTAHUD sharedInstance] loading];
                    break;
                case 1:
                    [[TTAHUD sharedInstance] loading:msg];
                    break;
                case 2:
                    [[TTAHUD sharedInstance] loading:msg inView:self.view];
                    break;
                case 3:
                    [[TTAHUD sharedInstance] loading:msg delay:2.f execute:^{
                        NSLog(@"execute");
                    } completionHandler:^{
                        NSLog(@"comlpetionHandler");
                    }];
                    break;
                default:
                    break;
            }
        }
            break;
        case 1: {
            switch (row) {
                case 0: {
                    MBProgressHUD *hud = [[TTAHUD sharedInstance] loading];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [[TTAHUD sharedInstance] stopLoading:hud];
                    });
                }
                    break;
                case 1: {
                    MBProgressHUD *hud = [[TTAHUD sharedInstance] loading];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [[TTAHUD sharedInstance] stopLoading:hud message:msg];
                    });
                }
                    break;
                case 2: {
                    MBProgressHUD *hud = [[TTAHUD sharedInstance] loading];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [[TTAHUD sharedInstance] stopLoading:hud message:msg delay:2.f completionHandler:^{
                            NSLog(@"commpletionHandler");
                        }];
                    });
                }
                    break;
                default:
                    break;
            }
        }
            break;
        case 2: {
            switch (row) {
                case 0:
                    [[TTAHUD sharedInstance] tipMessage:msg];
                    break;
                case 1:
                    [[TTAHUD sharedInstance] tipMessage:msg delay:1.f];
                    break;
                case 2:
                    [[TTAHUD sharedInstance] tipMessage:msg delay:1.f completionHandler:^{
                        NSLog(@"completionHandler");
                    }];
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
}


@end
