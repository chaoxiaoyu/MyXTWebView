//
//  XTWebViewController.m
//  XTWebView
//
//  Created by abc on 5/4/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "XTWebViewController.h"
#import "NextViewController.h"

@interface XTWebViewController ()

@end

@implementation XTWebViewController


- (void)viewDidLoad {
      [super viewDidLoad];
      
      _webView = [[XTWebView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
      _webView.scalesPageToFit = YES;
      _webView.scrollView.bounces = NO;
      [self.view addSubview:_webView];
      self.automaticallyAdjustsScrollViewInsets = NO;
      self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
      UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStylePlain target:self action:@selector(share)];
      self.navigationItem.rightBarButtonItem = rightItem;
      
      JSExportManager *manager = [[JSExportManager alloc] init];
      self.jsContext = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
      self.jsContext[@"XTWebView"] = manager;
      manager.jsContext = self.jsContext;
      manager.activityDelegate = self;
      manager.openNewWindowDelegate = self;
      self.jsContext.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
            context.exception = exceptionValue;
            NSLog(@"异常信息：%@", exceptionValue);
      };
}

- (void)viewDidAppear:(BOOL)animated
{
      [super viewDidAppear:YES];
}

- (void)share
{
      //      [_webView stringByEvaluatingJavaScriptFromString:@"jsFunc()"];
      //      JSContext *context = [_webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
      JSValue *jsTitle = _webView.jsContext[@"title"];
      JSValue *jsDescription = _webView.jsContext[@"description"];
      
      NSString *title = [[jsTitle callWithArguments:nil] toString];
      NSString *descriptions = [[jsDescription callWithArguments:nil] toString];
      NSString *urlStr = @"http://www.baidu.com";
      NSString *imgURLStr = @"http://image";
      
      NSLog(@"weixin1.title = %@",title);
      NSLog(@"weixin1.descriptions = %@",descriptions);
      
      ShareToWeiChat *weixin = [[ShareToWeiChat alloc] init];
      
      ShareToWeChatfriends *weixinFriends = [[ShareToWeChatfriends alloc] init];
      
      ShareToQQ *qq = [[ShareToQQ alloc] init];
      
      ShareToQQZone *qqZone = [[ShareToQQZone alloc] init];
      
      NSMutableArray *activitys = [[NSMutableArray alloc] initWithObjects:weixin,weixinFriends,qq,qqZone, nil];
      NSArray *activityItems = [NSArray arrayWithObjects:title, descriptions, urlStr, imgURLStr, nil];
      UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:activitys];
      [self presentViewController:activityViewController animated:YES completion:nil];
}

- (void)openNewWindowDelegate:(NSString *)urlStr
{
      dispatch_async(dispatch_get_main_queue(), ^{
            NextViewController *next = [[NextViewController alloc] init];
            NSURL *url = [NSURL URLWithString:urlStr];
            next.URL = url;
            [self.navigationController pushViewController:next animated:YES];
      });
}

- (void)showActivityViewController:(UIActivityViewController *)controller
{
      dispatch_async(dispatch_get_main_queue(), ^{
            [self presentViewController:controller animated:YES completion:nil];
      });
}

//- (void)openNewPage:(NSString *)urlStr
//{
//      dispatch_async(dispatch_get_main_queue(),^{
//            NextViewController *next = [[NextViewController alloc] init];
//            NSURL *url = [NSURL URLWithString:urlStr];
//            next.URL = url;
//            [self.navigationController pushViewController:next animated:YES];
//      });
//}
//
//- (void)donotOpenNewPage:(NSString *)urlStr
//{
//      dispatch_async(dispatch_get_main_queue(), ^{
//            [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
//      });
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
