//
//  ImageManipulator.h
//  maxfun
//
//  Created by Hampton Catlin on 27/07/09.
//  Copyright 2009 Wikimedia Foundation. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface ImageManipulator : NSObject {
}

+(UIImage *)makeRoundCornerImage:(UIImage*)img :(int) cornerWidth :(int) cornerHeight;
@end