//
//  TTAArrayDataSource.m
//  UtilsDemo
//
//  Created by TobyoTenma on 02/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTABaseArrayDataSource.h"

@interface TTABaseArrayDataSource () {
    /**
     *  数据源数组
     */
//    NSArray *_items;
    NSArray <NSArray <id> *> *_groups;
    NSArray <NSString *> *_headerTitles;
    NSArray <NSString *> *_footerTitles;
    /**
     *  cell 重用标识
     */
    NSString *_cellIdentifer;
    /**
     *  cell 配置回调 block
     */
    TTAConfigureCellBlock _configureCellBlock;
}
@end

@implementation TTABaseArrayDataSource
+ (instancetype)arrayDataSourceWithGroups:(NSArray *)aGroups cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(TTAConfigureCellBlock)aConfigureCellBlock {
    return [[self alloc] initWithGroups:(NSArray *)aGroups cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(void (^)(id cell, id item))aConfigureCellBlock];
}

- (instancetype)initWithGroups:(NSArray *)aGroups cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(TTAConfigureCellBlock)aConfigureCellBlock {
    if (self = [super init]) {
        _groups = aGroups;
        _cellIdentifer = aCellIdentifer;
        _configureCellBlock = aConfigureCellBlock;
    }
    return self;
}

- (NSArray <id>*)groupAtSection:(NSInteger)section {
    return _groups[section];
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return [self groupAtSection:indexPath.section][indexPath.row];
}

- (NSString *)headerTitleAtSection:(NSInteger)section {
    return _headerTitles[section];
}

- (NSString *)footerTitleAtSection:(NSInteger)section {
    return _footerTitles[section];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self groupAtSection:section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifer forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    _configureCellBlock(cell, item);
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self headerTitleAtSection:section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return [self footerTitleAtSection:section];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _groups.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self groupAtSection:section].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [collectionView dequeueReusableCellWithReuseIdentifier:_cellIdentifer forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    _configureCellBlock(cell, item);
    return cell;
}


#pragma mark - Getter && Setter

/**
 设置数据源的数据数组

 @param aView 数据源作用的 tableView 或者 collectionView
 @param groups 数据数组
 */
- (void)setView:(id)aView withGroups:(NSArray *)groups {
    _groups = groups;
    
    if ([aView isKindOfClass:[UITableView class]] || [aView isKindOfClass:[UICollectionView class]]) {
        [aView reloadData];
    }
}

- (void)setHeaderTitles:(NSArray <NSString *> *)headerTitles {
    _headerTitles = headerTitles;
}

- (void)setFooterTitles:(NSArray <NSString *> *)footerTitles {
    _footerTitles = footerTitles;
}

@end
