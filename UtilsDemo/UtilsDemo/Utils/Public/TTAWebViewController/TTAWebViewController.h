//
//  TTAWebViewController
//  ZLCWebView
//
//  Created by TobyoTenma on 16/6/25.
//  Copyright © 2016年 TobyoTenma. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZLCWebView, WKScriptMessage;

@interface TTAWebViewController : UIViewController

@property (nonatomic, strong) ZLCWebView *webView;

@property (nonatomic,retain) NSString *urlString;
@property (nonatomic, copy) NSString *htmlString;
@property (nonatomic, strong) NSURL *url;

/**
 js调用的方法名数组
 */
@property (nonatomic, strong) NSArray <NSString *>*jsCalledMessages;
/**
 接收到 js 消息后调用此 block
 */
@property (nonatomic, copy) void (^receivedJSMessageBlock)(WKScriptMessage *message);
@end
