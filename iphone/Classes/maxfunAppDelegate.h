//
//  maxfunAppDelegate.h
//  maxfun
//
//  Created by Hampton Catlin on 27/07/09.
//  Copyright Wikimedia Foundation 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@class maxfunViewController;

@interface maxfunAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    maxfunViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet maxfunViewController *viewController;

@end

