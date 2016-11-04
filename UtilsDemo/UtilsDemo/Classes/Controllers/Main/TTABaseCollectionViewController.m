//
//  TTABaseCollectionViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 31/10/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTABaseCollectionViewController.h"
#import "TTABaseArrayDataSource.h"

#define CellIdentifer @"cell"

@interface TTABaseCollectionViewController () {
    UICollectionView *_collectionView;
    
    /**
     *  数据源
     */
    TTABaseArrayDataSource *_baseArrayDataSource;
}

@end

@implementation TTABaseCollectionViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getData];
}

#pragma mark - UI
- (void)setupUI {
    [super setupUI];
    [self prepareCollectionView];
}

- (void)prepareCollectionView {
    _baseArrayDataSource = [TTABaseArrayDataSource arrayDataSourceWithItems:nil cellIdentifer:CellIdentifer configureCellBlock:^(id cell, id item) {
        UICollectionViewCell *aCell = (UICollectionViewCell *)cell;
        aCell.backgroundColor = item;
    }];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    _collectionView.backgroundColor = kWHITE_COLOR;
    _collectionView.dataSource = _baseArrayDataSource;
    _collectionView.delegate = self;
    
    [self registerCells];
    
    [self.view addSubview:_collectionView];
}

/**
 注册 tableViewCell
 */
- (void)registerCells {
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifer];
}

/**
 获取数据
 */
- (void)getData {
    NSArray *items = @[kRED_COLOR, kBLUE_COLOR, kBLACK_COLOR, kORANGE_COLOR, kLIGHT_GRAY_COLOR, kDARK_GRAY_COLOR, kGRAY_COLOR];
    [_baseArrayDataSource setView:_collectionView withItems:items];
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}

@end
