//
//  TTABaseTableViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTABaseTableViewController.h"
#import "TTABaseArrayDataSource.h"

#define CellIdentifier @"cell"

@interface TTABaseTableViewController () {
    UITableView *_tableView;
    /**
     *  数据源
     */
    TTABaseArrayDataSource *_baseArrayDataSource;
}
@end

@implementation TTABaseTableViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self layoutTableView];
}

#pragma mark - UI
- (void)setupUI {
    [super setupUI];
    [self prepareTableView];
}
// TODO: 异步获取数据优化
- (void)prepareTableView {
    [self getDataSucc:^(NSArray *items) {
        _baseArrayDataSource = [TTABaseArrayDataSource arrayDataSourceWithItems:items cellIdentifer:CellIdentifier configureCellBlock:^(id cell, id item) {
            UITableViewCell *aCell = (UITableViewCell *)cell;
            aCell.textLabel.text = item;
        }];
        [_tableView reloadData];
    } failed:^(NSString *error) {
        
    }];
    
    _tableView = [[UITableView alloc] init];
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.dataSource = _baseArrayDataSource;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    [self.view addSubview:_tableView];
}

- (void)layoutTableView {
    _tableView.frame = self.view.bounds;
}

#pragma mark - Data
- (void)getDataSucc:(void (^)(NSArray *items))succ failed:(void (^)(NSString *error))failed {
    NSArray *items = @[@"hello", @"world", @"tomorrow", @"today", @"yestoday"];
    succ(items);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
