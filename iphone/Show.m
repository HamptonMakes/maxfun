//
//  Show.m
//  maxfun
//
//  Created by Hampton Catlin on 27/07/09.
//  Copyright 2009 Wikimedia Foundation. All rights reserved.
//

#import "Show.h"


@implementation Show

@synthesize guests;
@synthesize link;
@synthesize date;
@synthesize media;
@synthesize title;
@synthesize description;
@synthesize img;
@synthesize sid;
@synthesize smallImage;
@synthesize cell;

- (NSString *)shortTitle {
  NSRange range = [self.guests rangeOfString:@", "];
  if(range.length > 0) {
    return [self.guests substringToIndex:range.location];
  } else {
    return guests;
  }
}
- (UIImage *) displayImage:(UITableViewCell *)newCell {
  if(cachedImage != nil) {
    return cachedImage;
  }
  
  self.cell = newCell;
 
  
  [NSThread detachNewThreadSelector:@selector(loadImage) toTarget:self withObject:nil];
  return nil;
}

-(void)loadImage {
  
  NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.smallImage] cachePolicy:NSURLRequestUseProtocolCachePolicy
                                       timeoutInterval:60.0];
  NSURLResponse *response;
  NSError *error;
  
  NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
  
  cachedImage = [UIImage imageWithData:data];
  
  self.cell.imageView.image = cachedImage;
  self.cell.imageView.alpha = 1.0;
}

@end
