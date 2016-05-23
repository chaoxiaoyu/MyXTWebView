//
//  JSExportManager+JSOpenNewWindow.h
//  ShiErXing
//
//  Created by abc on 3/5/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "JSExportManager.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol  JSOpenNewWindow<JSExport>

- (void)openNewWindow:(NSString *)urlStr;

- (void)openByDefaultBrowser:(NSString *)urlStr;

@end

@interface JSExportManager (JSOpenNewWindow)<JSOpenNewWindow>

@end
