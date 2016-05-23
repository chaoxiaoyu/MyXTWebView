//
//  JSExportManager+JSShareExport.h
//  ShiErXing
//
//  Created by abc on 3/5/16.
//  Copyright © 2016年 com.xiangtian. All rights reserved.
//

#import "JSExportManager.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ShareProtocol <JSExport>

JSExportAs(share,- (void)shareWithTitle:(NSString *)title andDescription:(NSString *)description andImgURLStr:(NSString *)imgURLStr andURLStr:(NSString *)urlStr);

@end


@interface JSExportManager (JSShareExport)<ShareProtocol>

@end
