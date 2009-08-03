//
//  maxfunAppDelegate.m
//  maxfun
//
//  Created by Hampton Catlin on 27/07/09.
//  Copyright Wikimedia Foundation 2009. All rights reserved.
//

#import "maxfunAppDelegate.h"
#import "maxfunViewController.h"

@implementation maxfunAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
