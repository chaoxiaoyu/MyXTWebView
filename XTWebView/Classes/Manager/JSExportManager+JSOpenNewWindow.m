//
//  JSExportManager+JSOpenNewWindow.m
//  ShiErXing
//
//  Created by abc on 3/5/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "JSExportManager+JSOpenNewWindow.h"

@implementation JSExportManager (JSOpenNewWindow)

- (void)openNewWindow:(NSString *)urlStr
{
      if ([self.openNewWindowDelegate respondsToSelector:@selector(openNewWindowDelegate:)])
      {
            [self.openNewWindowDelegate openNewWindowDelegate:urlStr];
      }
}

- (void)openByDefaultBrowser:(NSString *)urlStr
{
      [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
}

@end
