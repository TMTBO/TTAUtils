//
//  TTATestTableViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 04/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTATestTableViewController.h"
#import "TTABaseArrayDataSource.h"

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
    [_baseArrayDataSource setView:_tableView withItems:@[@"heh", @"haha", @"heihei"]];
}

@end
