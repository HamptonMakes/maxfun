//
//  ShowViewController.h
//  maxfun
//
//  Created by Hampton Catlin on 27/07/09.
//  Copyright 2009 Wikimedia Foundation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Show.h"


@interface ShowViewController : UIViewController {
  IBOutlet UIWebView *webView;
  Show *show;
}

-(IBAction)closeView:(id)sender;
-(void)clearWebView;

@property (nonatomic, retain) Show *show;

@end
