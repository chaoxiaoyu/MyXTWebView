//
//  WechatPay.m
//  XTWebView
//
//  Created by abc on 31/3/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "WechatPay.h"

@implementation WechatPay

- (void)payByWeChat:(NSDictionary *)dic//微信支付
{
      NSLog(@"payByWeChat");
      
      PayReq *req = [[PayReq alloc] init];
//      JSValue *jsWeixinPay = self.jsContext[@"weixinPay"];
//      JSValue *jsDic = [jsWeixinPay callWithArguments:nil];
//      NSDictionary *dic = [jsDic toDictionary];
      req.partnerId = dic[@"partnerId"];
      req.prepayId = dic[@"prepayId"];
      req.nonceStr = dic[@"nonceStr"];
      NSNumber *time = dic[@"timeStamp"];
      req.timeStamp = (UInt32)[time intValue];
      req.package = dic[@"package"];
      req.sign = dic[@"sign"];
      [WXApi sendReq:req];
}

@end
