//
//  XTWebViewController.h
//  XTWebView
//
//  Created by abc on 5/4/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "XTWebView.h"
#import "JSExportManager.h"
#import "ShareToWeiChat.h"
#import "ShareToQQ.h"
#import "ShareToQQZone.h"
#import "ShareToWeChatfriends.h"
#import <JavaScriptCore/JavaScriptCore.h>


@interface XTWebViewController : UIViewController<UIWebViewDelegate,ShowActivityViewController,OpenNewWindow>

@property(nonatomic, strong) XTWebView *webView;
@property(nonatomic, strong) JSContext *jsContext;



@end

