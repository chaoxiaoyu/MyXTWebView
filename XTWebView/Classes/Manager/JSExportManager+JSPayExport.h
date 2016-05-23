//
//  JSExportManager+JSPayExport.h
//  ShiErXing
//
//  Created by abc on 3/5/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "JSExportManager.h"
#import "WechatPay.h"
#import "Alipay.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol  payProtocol<JSExport>

- (void)payByAlipay:(NSString *)orderStr;//支付宝支付

- (void)payByWeChat:(NSDictionary *)dic;//微信支付

@end

@interface JSExportManager (JSPayExport)<payProtocol>

@end
