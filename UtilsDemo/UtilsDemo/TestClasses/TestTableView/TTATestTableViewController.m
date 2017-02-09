//
//  TTATestTableViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 04/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTATestTableViewController.h"
#import "TTAViewController.h"
#import "TTAHUDTestTableViewController.h"

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
    [_baseArrayDataSource setView:_tableView withGroups:@[@[@"heh", @"haha", @"heihei", @"hafdo",@"测试 webview", @"TTAHUD Test"]]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    
    [self testJumpVcWith:indexPath];
}

/** 测试 AppDelegate 方法中的控制器跳转方法 */
- (void)testJumpVcWith:(NSIndexPath *)indexPath {
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
//        self.navigationController.navigationBar.hidden = YES;
        webVc.urlString = @"https://www.baidu.com";
        Vc = webVc;
    } else if (indexPath.row == 5) {
        Vc = [[TTAHUDTestTableViewController alloc] init];
    } else {
        NSAssert(YES, @"Please add the action of the item at: %zd section %zd row", indexPath.section, indexPath.row);
    }
    
    Vc.title = [NSString stringWithFormat:@"%zd", idx];
    [self addChildViewController:Vc];
    [[AppDelegate sharedAppDelegate] pushViewController:Vc];
}

@end
