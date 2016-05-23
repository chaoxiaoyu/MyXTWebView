//
//  JSExportManager+JSShareExport.m
//  ShiErXing
//
//  Created by abc on 3/5/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "JSExportManager+JSShareExport.h"
#import "ShareToQQ.h"
#import "ShareToQQZone.h"
#import "ShareToWeChatfriends.h"
#import "ShareToWeiChat.h"

@implementation JSExportManager (JSShareExport)


- (void)shareWithTitle:(NSString *)title andDescription:(NSString *)description andImgURLStr:(NSString *)imgURLStr andURLStr:(NSString *)urlStr
{
      ShareToQQ *qq = [[ShareToQQ alloc] init];
      ShareToQQZone *qqZone = [[ShareToQQZone alloc] init];
      ShareToWeiChat *weChat = [[ShareToWeiChat alloc] init];
      ShareToWeChatfriends *weChatFrients = [[ShareToWeChatfriends alloc] init];
      NSArray *activities = [NSArray arrayWithObjects:qq, qqZone, weChat, weChatFrients, nil];
      NSArray *activityItems = [NSArray arrayWithObjects:title, description,imgURLStr,urlStr, nil];
      UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:activities];
      if([self.activityDelegate respondsToSelector:@selector(showActivityViewController:)])
      {
            [self.activityDelegate showActivityViewController:activityViewController];
      }
      
}

@end
