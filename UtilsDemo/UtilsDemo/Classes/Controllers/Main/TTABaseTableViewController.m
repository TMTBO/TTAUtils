//
//  TTABaseTableViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTABaseTableViewController.h"
#import "TTABaseArrayDataSource.h"

#import "TTATestTableViewController.h"

#define CellIdentifier @"cell"

@interface TTABaseTableViewController () 
@end

@implementation TTABaseTableViewController
#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
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

- (void)prepareTableView {
    _baseArrayDataSource = [TTABaseArrayDataSource arrayDataSourceWithItems:nil cellIdentifer:CellIdentifier configureCellBlock:^(id cell, id item) {
        UITableViewCell *aCell = (UITableViewCell *)cell;
        aCell.textLabel.text = item;
    }];
    
    _tableView = [[UITableView alloc] init];
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.dataSource = _baseArrayDataSource;
    _tableView.delegate = self;
    
    [self registerCells];
    
    [self.view addSubview:_tableView];
}

- (void)registerCells {
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
}

- (void)layoutTableView {
    _tableView.frame = self.view.bounds;
}

#pragma mark - Data
- (void)getData {
    NSArray *items = @[@"hello", @"world", @"tomorrow", @"today", @"yestoday"];
    
    [_baseArrayDataSource setView:_tableView withItems:items];
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TTATestTableViewController *testVc = [[TTATestTableViewController alloc] init];
    [self.navigationController pushViewController:testVc animated:YES];
}



@end
