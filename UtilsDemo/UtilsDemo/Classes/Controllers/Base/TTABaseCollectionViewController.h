//
//  TTABaseCollectionViewController.h
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTABaseViewController.h"
#import "TTABaseArrayDataSource.h"

@interface TTABaseCollectionViewController : TTABaseViewController <UICollectionViewDelegate>


/**
 注册 collectionViewCell
 */
- (void)registerCells;

@end
