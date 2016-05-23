//
//  XTViewController.m
//  XTWebView
//
//  Created by cxy on 05/21/2016.
//  Copyright (c) 2016 cxy. All rights reserved.
//

#import "XTViewController.h"

@interface XTViewController ()

@end

@implementation XTViewController

- (void)viewDidLoad
{
      [super viewDidLoad];
      NSURL *url = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"html"];
      [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
