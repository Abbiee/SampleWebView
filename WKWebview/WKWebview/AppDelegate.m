//
//  AppDelegate.m
//  WKWebview
//
//  Created by Abbie on 17/09/20.
//  Copyright © 2020 Abbie. All rights reserved.
//

#import "AppDelegate.h"
#import "OverLayViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}
- (void)applicationDidEnterBackground:(UIApplication *)application {
    OverLayViewController *blankViewController = [OverLayViewController new];
    blankViewController.view.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    [self.window.rootViewController presentViewController:blankViewController animated:NO completion:NULL];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    UIViewController *test = [self topViewController];
    if ([test isKindOfClass:[OverLayViewController class]]) {
           [self.window.rootViewController dismissViewControllerAnimated:false completion:nil];
    }
}
- (UIViewController*)topViewController {
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

-(UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController {
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return [self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}
@end
