//
//  TTAViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 06/11/2016.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "TTAViewController.h"
#import "TTATestTableViewController.h"
#import "TTALanguageTool.h"

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

- (void)setupUI {
    [self testUIButtonLayoutType];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
}

- (void)testChangeLanguage {
    self.title = TTANSLocalizedString(@"baseVcTitle");
}

- (void)testSetNewLanguage {
    [[TTALanguageTool sharedTool] setNewLanguage:kAppLanguageEN];
}

- (void)testGetCurrentLanguage {
    NSString *language = [[TTALanguageTool sharedTool] getCurrentLanguage];
    NSLog(@"current language %@", language);
    
}

- (void)testUIButtonLayoutType {
    UIButton *button = [[UIButton alloc] init];
    [self.view addSubview:button];
    button.frame = CGRectMake(0, 0, 200, 200);
    [button tta_centerEqualToView:self.view];
    [button setBackgroundColor:kLIGHT_GRAY_COLOR];
    
    [button setImage:[UIImage tta_imageWithColor:kBLUE_COLOR withFrame:CGRectMake(0, 0, 50,50)] forState:UIControlStateNormal];
    [button setTitle:@"Hello world" forState:UIControlStateNormal];
    [button setButtonLayoutType:UIButtonLayoutTypeImageCenterTitleBottomToButton padding:10.f];
}

/** uiview 添加手势方法测试 */
- (void)testViewAddTapGesture {
    UIView *testView = [[UIView alloc] init];
    testView.chain_x(self.view.center.x).chain_y(0).chain_size(CGSizeMake(100, 100));
    testView.backgroundColor = kORANGE_COLOR;
    [testView tta_addTapGestureWithBlock:^(UITapGestureRecognizer *tapGesture) {
        NSLog(@"come here");
    }];
    [self.view addSubview:testView];
}
/** AppDelegate 中中转方法测试 */
- (void)push2AnotherController {
    TTATestTableViewController *Vc = [[TTATestTableViewController alloc] init];
    [self addChildViewController:Vc];
    [[AppDelegate sharedAppDelegate] pushViewController:Vc];
}

@end
