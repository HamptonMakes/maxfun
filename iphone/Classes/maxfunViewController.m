//
//  maxfunViewController.m
//  maxfun
//
//  Created by Hampton Catlin on 27/07/09.
//  Copyright Wikimedia Foundation 2009. All rights reserved.
//

#import "maxfunViewController.h"

@implementation maxfunViewController

@synthesize shows;
@synthesize defaultCellImage;

- (void)loadData {
  NSURL *url = [NSURL URLWithString:@"http://localhost:3000/shows.js?version=1"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  NSError *error;
  NSURLResponse *response;
  
  NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
  NSString *dataString = [NSString stringWithCString:[data bytes] encoding: [NSString defaultCStringEncoding]];
  
  NSRange end = [dataString rangeOfString:@"}]" options:NSBackwardsSearch];
  
  dataString = [dataString substringToIndex:(end.location + end.length)];
  
  NSLog(@"%@", dataString);
  
  NSArray *dataArray = (NSArray *)[dataString JSONValue];
  
  shows = [NSMutableArray new];
  
  for(int i = 0; i < [dataArray count]; i++) {
    Show *s = [[Show alloc] init];
    NSDictionary *showData = [dataArray objectAtIndex:i];
    s.link        = [showData objectForKey:@"link"];
    s.media       = [showData objectForKey:@"media"];
    s.guests      = [showData objectForKey:@"guests"];
    s.title       = [showData objectForKey:@"title"];
    s.img         = [showData objectForKey:@"img"];
    s.description = [showData objectForKey:@"description"];
    s.sid         = [showData objectForKey:@"id"];
    s.smallImage  = [showData objectForKey:@"small_img"];
    [shows addObject:s];
  }
}


/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  [self loadData];
  [super viewDidLoad];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [shows count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  
  static NSString *CellIdentifier = @"Cell";
  
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  //if (cell == nil) {
    cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
  //}
  
  if(defaultCellImage == nil) {
    UIImage *image = [UIImage imageNamed:@"cellicon.png"];
    defaultCellImage = [ImageManipulator makeRoundCornerImage:image :10 :10];
  }
  
  Show *s = [shows objectAtIndex:indexPath.row];
  
  // Set up the cell...
  cell.textLabel.text = [s shortTitle];
  cell.textLabel.textColor = [UIColor colorWithRed:0.0F green:0.262F blue:0.298F alpha:1.0];
  cell.detailTextLabel.text = s.guests;
  
  UIImage *image = defaultCellImage;
  if([s.smallImage isKindOfClass:[NSString class]]) {
    image = [s displayImage:cell];
    if(image == nil) {
      image = defaultCellImage;
    }
  } else {
    cell.imageView.alpha = 0.6;
  }
  
  
  cell.imageView.image = image;
  return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
  Show *s = [self.shows objectAtIndex:indexPath.row];
  showViewController.show = s;
  [self presentModalViewController:showViewController animated:YES];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
