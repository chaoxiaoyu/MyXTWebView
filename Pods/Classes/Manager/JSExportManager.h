//
//  SharePayAndScanManager.h
//  XTWebView
//
//  Created by abc on 31/3/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol OpenNewWindow <NSObject>

- (void)openNewWindowDelegate:(NSString *)urlStr;

@end

@protocol ShowActivityViewController <NSObject>

- (void)showActivityViewController:(UIActivityViewController *)controller;

@end


@interface JSExportManager : NSObject

@property (nonatomic, strong)JSContext *jsContext;
@property (nonatomic, weak)id<ShowActivityViewController>activityDelegate;
@property (nonatomic, weak)id<OpenNewWindow>openNewWindowDelegate;

@end
