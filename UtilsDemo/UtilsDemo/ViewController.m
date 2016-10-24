//
//  ViewController.m
//  UtilsDemo
//
//  Created by TobyoTenma on 9/15/16.
//  Copyright © 2016 TobyoTenma. All rights reserved.
//

#import "ViewController.h"
//#import "UtilsDemo-Swift.h"
#import "TTAWebViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view layoutIfNeeded];
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testTTAWebViewController];
    
}

- (void)testTTAWebViewController {
    TTAWebViewController *webVc = [[TTAWebViewController alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"TestPay" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
//    webVc.urlString = @"https://www.baidu.com";
    webVc.url = url;
    webVc.jsCalledMessages = @[@"pay", @"alipay"];
    [self addChildViewController:webVc];
    [self.view addSubview:webVc.view];
}

- (void)testAlertCommon {
    [UIAlertController tta_showAlertWithTitle:@"hah" message:@"hehehkahl" target:self confirmAction:^{
        NSLog(@"hakhds;iap");
    } cancelAction:nil];
}

- (void)testUIViewCommon {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor orangeColor];
    view.tta_width = 100;
    view.tta_height = 100;
    view.center = self.view.center;
    NSLog(@"x------%f", view.tta_x);
    view.chain_x(300).chain_y(500);
    NSLog(@"x------%f", view.tta_x);
    [self.view addSubview:view];
    
    //    [view tta_cornerWithCornerRadius:10];
    [view cornerWithRadius:10];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor redColor];
    imageView.tta_size = CGSizeMake(100, 100);
    imageView.tta_origin = CGPointMake(0, 0);
    imageView.chain_x(150).chain_y(500);
    NSLog(@"imageview.frame:%f,%f,%f,%f", imageView.tta_x,imageView.tta_y,imageView.tta_width,imageView.tta_height);
    [imageView cornerWithRadius:10];
    [self.view addSubview:imageView];
}



@end
