//
//  iCarouselExampleAppDelegate.m
//  iCarouselExample
//
//  Created by Nick Lockwood on 03/04/2011.
//  Copyright 2011 Charcoal Design. All rights reserved.
//

#import "iCarouselExampleAppDelegate.h"
#import "iCarouselExampleViewController.h"

@implementation iCarouselExampleAppDelegate

@synthesize window;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
    return YES;
}


@end
