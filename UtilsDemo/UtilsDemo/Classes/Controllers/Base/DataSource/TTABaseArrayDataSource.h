//
//  TTAArrayDataSource.h
//  UtilsDemo
//
//  Created by TobyoTenma on 02/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TTAConfigureCellBlock)(id cell, id item);

@interface TTABaseArrayDataSource : NSObject <UITableViewDataSource, UICollectionViewDataSource>

+ (instancetype)arrayDataSourceWithGroups:(NSArray *)aGroups cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(TTAConfigureCellBlock)aConfigureCellBlock;

- (instancetype)initWithGroups:(NSArray *)aGroups cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(TTAConfigureCellBlock)aConfigureCellBlock;

/**
 获取数据源中对应数据
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

/**
 设置数据源的数据数组,设置完成后自动刷新
 
 @param aView 数据源作用的 tableView 或者 collectionView
 @param groups 数据数组
 */
- (void)setView:(id)aView withGroups:(NSArray *)groups;

@end
