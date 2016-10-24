//
//  TTAWebViewController.m
//  ZLCWebView
//
//  Created by TobyoTenma on 16/6/25.
//  Copyright © 2016年 TobyoTenma. All rights reserved.
//

#import "TTAWebViewController.h"
#import "ZLCWebView.h"

@interface TTAWebViewController () <ZLCWebViewDelegate>
{
    ZLCWebView *myWebView;
}

@property (nonatomic, weak) UIButton * backItem;
@property (nonatomic, weak) UIButton * closeItem;

@end

@implementation TTAWebViewController
-(void)dealloc {
    [myWebView.wkWebView.configuration.userContentController removeAllUserScripts];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    myWebView = [[ZLCWebView alloc]initWithFrame:self.view.bounds jsCalledMessages:self.jsCalledMessages];

//    myWebView = [[ZLCWebView alloc]initWithFrame:self.view.bounds];
    
    myWebView.delegate = self;
    if (self.urlString) {
        [myWebView loadURLString:self.urlString];
    } else if (self.url) {
        [myWebView loadURL:self.url];
    } else if (self.htmlString) {
        [myWebView loadHTMLString:self.htmlString];
    }
    [self.view addSubview:myWebView];
    
    [self initNaviBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNaviBar{
    
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame = CGRectMake(0, 0, 20, 44);
    [leftButton setImage:[UIImage imageNamed:@"img_nav_back"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(clickedBackItem:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -5, 0, 0)];
    self.backItem = leftButton;
    [backView addSubview:leftButton];
    
    UIButton * closeItem = [[UIButton alloc]initWithFrame:CGRectMake(20+12, 0, 44, 44)];
    [closeItem setTitle:@"关闭" forState:UIControlStateNormal];
    [closeItem.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [closeItem setTitleColor:kBlueColor forState:UIControlStateNormal];
    [closeItem addTarget:self action:@selector(clickedCloseItem:) forControlEvents:UIControlEventTouchUpInside];
    closeItem.hidden = YES;
    self.closeItem = closeItem;
    [backView addSubview:closeItem];
    
    UIBarButtonItem * leftItemBar = [[UIBarButtonItem alloc]initWithCustomView:backView];
    self.navigationItem.leftBarButtonItem = leftItemBar;
}

- (void)zlcwebViewDidReceivedJSMessage:(WKScriptMessage *)message {
    NSLog(@"接收到js的消息:%@", message.name);
}

- (void)zlcwebViewDidStartLoad:(ZLCWebView *)webview
{
    NSLog(@"页面开始加载");
}

- (void)zlcwebView:(ZLCWebView *)webview shouldStartLoadWithURL:(NSURL *)URL
{
    NSLog(@"截取到URL：%@",URL);
    if (webview.uiWebView) {
        if ([webview.uiWebView canGoBack]) {
            self.closeItem.hidden = NO;
        }
    }else{
        if ([webview.wkWebView canGoBack]) {
            self.closeItem.hidden = NO;
        }
    }
    
}
- (void)zlcwebView:(ZLCWebView *)webview didFinishLoadingURL:(NSURL *)URL
{
    NSLog(@"页面加载完成");
    if (webview.uiWebView) {
        self.title = [webview.uiWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    }else{
        self.title = webview.wkWebView.title;
    }
}

- (void)zlcwebView:(ZLCWebView *)webview didFailToLoadURL:(NSURL *)URL error:(NSError *)error
{
    NSLog(@"加载出现错误");
}

#pragma mark - clickedCloseItem
- (void)clickedCloseItem:(UIButton *)btn{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - clickedBackItem
- (void)clickedBackItem:(UIBarButtonItem *)btn{
    if (myWebView.uiWebView) {
        if ([myWebView.uiWebView canGoBack]) {
            [myWebView.uiWebView goBack];
            self.closeItem.hidden = NO;
        }else{
            [self clickedCloseItem:nil];
        }
    }else{
        if ([myWebView.wkWebView canGoBack]) {
            [myWebView.wkWebView goBack];
            self.closeItem.hidden = NO;
        }else{
            [self clickedCloseItem:nil];
        }
    }
}


@end
