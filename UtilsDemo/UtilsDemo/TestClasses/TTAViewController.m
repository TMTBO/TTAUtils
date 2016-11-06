//
//  TTAViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 06/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTAViewController.h"
#import "TTATestTableViewController.h"

@interface TTAViewController ()

@end

@implementation TTAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    TTATestTableViewController *Vc = [[TTATestTableViewController alloc] init];
    [self addChildViewController:Vc];
    [[AppDelegate sharedAppDelegate] pushViewController:Vc];
}

@end
