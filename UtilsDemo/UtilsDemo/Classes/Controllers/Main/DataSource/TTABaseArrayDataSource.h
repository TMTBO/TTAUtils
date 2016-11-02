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

+ (instancetype)arrayDataSourceWithItems:(NSArray *)anItems cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(TTAConfigureCellBlock)aConfigureCellBlock;

- (instancetype)initWithItems:(NSArray *)anItems cellIdentifer:(NSString *)aCellIdentifer configureCellBlock:(TTAConfigureCellBlock)aConfigureCellBlock;

/**
 获取数据源中对应数据
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
