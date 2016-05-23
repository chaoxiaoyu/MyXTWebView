//
//  JSExportManager+JSPayExport.m
//  ShiErXing
//
//  Created by abc on 3/5/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "JSExportManager+JSPayExport.h"

@implementation JSExportManager (JSPayExport)

- (void)payByAlipay:(NSString *)orderStr //支付宝支付
{
      Alipay *alipay = [[Alipay alloc] init];
      [alipay payByAlipay:orderStr];
}

- (void)payByWeChat:(NSDictionary *)dic //微信支付
{
      WechatPay *wechatPay = [[WechatPay alloc] init];
      [wechatPay payByWeChat:dic];
}

@end
