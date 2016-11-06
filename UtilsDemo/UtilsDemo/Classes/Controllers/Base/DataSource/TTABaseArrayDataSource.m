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
    NSArray *_items;
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
+ (instancetype)arrayDataSourceWithItems:(NSArray *)anItems cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(TTAConfigureCellBlock)aConfigureCellBlock {
    return [[self alloc] initWithItems:(NSArray *)anItems cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(void (^)(id cell, id item))aConfigureCellBlock];
}

- (instancetype)initWithItems:(NSArray *)anItems cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(TTAConfigureCellBlock)aConfigureCellBlock {
    if (self = [super init]) {
        _items = anItems;
        _cellIdentifer = aCellIdentifer;
        _configureCellBlock = aConfigureCellBlock;
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return _items[indexPath.row];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifer forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    _configureCellBlock(cell, item);
    return cell;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items.count;
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
 @param items 数据数组
 */
- (void)setView:(id)aView withItems:(NSArray *)items {
    _items = items;
    
    if ([aView isKindOfClass:[UITableView class]] || [aView isKindOfClass:[UICollectionView class]]) {
        [aView reloadData];
    }
}
@end
