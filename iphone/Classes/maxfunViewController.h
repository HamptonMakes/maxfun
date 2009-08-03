//
//  maxfunViewController.h
//  maxfun
//
//  Created by Hampton Catlin on 27/07/09.
//  Copyright Wikimedia Foundation 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"
#import "JSON.h"
#import "ShowViewController.h"
#import "ImageManipulator.h"

@interface maxfunViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
  NSMutableArray *shows;
  IBOutlet ShowViewController *showViewController;
  UIImage *defaultCellImage;
}

- (void)loadData;

@property (nonatomic, retain) NSMutableArray *shows;
@property (nonatomic, retain) UIImage *defaultCellImage;

@end

