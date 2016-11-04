//
//  TTABaseTableViewController.h
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTABaseViewController.h"

@class TTABaseArrayDataSource;

@interface TTABaseTableViewController : TTABaseViewController <UITableViewDelegate>{
    UITableView *_tableView;
    /**
     *  数据源
     */
    TTABaseArrayDataSource *_baseArrayDataSource;
}

/**
 注册 tableViewCell
 */
- (void)registerCells;

@end
