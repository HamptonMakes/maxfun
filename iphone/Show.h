//
//  Show.h
//  maxfun
//
//  Created by Hampton Catlin on 27/07/09.
//  Copyright 2009 Wikimedia Foundation. All rights reserved.
//

@interface Show : NSObject {
  NSString *guests;
  NSString *link;
  NSString *media;
  NSString *description;
  NSString *img;
  NSString *title;
  NSString *smallImage;
  UIImage *cachedImage;
  NSDate *date;
  NSString *sid;
  UITableViewCell *cell;
}

- (NSString *) shortTitle;
- (UIImage *) displayImage:(UITableViewCell *)newCell;

@property (nonatomic, retain) NSString *guests;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *img;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *media;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) NSString *sid;
@property (nonatomic, retain) NSString *smallImage;
@property (nonatomic, retain) UITableViewCell *cell;

@end
