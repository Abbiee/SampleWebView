//
//  WebViewController.m
//  WKWebview
//
//  Created by Abbie on 17/09/20.
//  Copyright © 2020 Abbie. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewController ()
@property (strong, nonatomic) IBOutlet WKWebView *sampleWebView;
@property (strong, nonatomic) NSString *productURL;


@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.productURL = @"https://en.wikipedia.org/wiki/Cereal";

    NSURL *url = [NSURL URLWithString:self.productURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.sampleWebView loadRequest:request];
    [self.view addSubview:self.sampleWebView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
