//
//  TTATestTableViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 04/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTATestTableViewController.h"
#import "TTABaseArrayDataSource.h"
#import "TTAViewController.h"

#import "TTAWebViewController.h"

@interface TTATestTableViewController ()

@end

@implementation TTATestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getData {
    [_baseArrayDataSource setView:_tableView withItems:@[@"heh", @"haha", @"heihei", @"hafdo",@"测试 webview"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        [[AppDelegate sharedAppDelegate] popToViewControllerWithClass:[TTAViewController class]];
        return;
    }
    static NSInteger idx = 0;
    idx++;
    
    UIViewController *Vc;
    
    if (indexPath.row == 1) {
        Vc = [[TTAViewController alloc] init];
    } else if (indexPath.row == 2) {
        Vc = [[TTATestTableViewController alloc] init];
    } else if (indexPath.row == 3) {
        [[AppDelegate sharedAppDelegate] popToViewControllerWithindex:5];
        return;
    } else if (indexPath.row == 4) {
        TTAWebViewController *webVc = [[TTAWebViewController alloc] init];
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"TestPay.html" ofType:nil];
        webVc.urlString = @"https://www.baidu.com";
        Vc = webVc;
    }
    
    Vc.title = [NSString stringWithFormat:@"%zd", idx];
    [self addChildViewController:Vc];
    [[AppDelegate sharedAppDelegate] pushViewController:Vc];
}

@end
