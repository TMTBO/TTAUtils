//
//  TTACoreDataManagedContext.h
//  UtilsDemo
//
//  Created by TobyoTenma on 01/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreData;

#define kTTACoreDataManagedContext [TTACoreDataManagedContext shareInstance]

#define kFileName @"mysql"

@interface TTACoreDataManagedContext : NSObject

+ (TTACoreDataManagedContext *)shareInstance;

//管理对象的上下文
@property(nonatomic,strong)NSManagedObjectContext *managedObjectContext;

//模型对象
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;

//存储调度器
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//保存到数据库
- (void)save;


//清空所有数据
- (void)deleteAllEntites;

//查询数据
- (NSArray *)fetchDataWithEntityName:(NSString *)name Predicate:(NSPredicate *)predicate;
@end
