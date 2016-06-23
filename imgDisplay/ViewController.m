//
//  ViewController.m
//  imgDisplay
//
//  Created by Valtteri Koskivuori on 23/06/16.
//  Copyright © 2016 Valtteri Koskivuori. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.mainDelegate = [[AppDelegate alloc] init];
	
	NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(updateView) userInfo:nil repeats:YES];
	[timer fire];
}

- (void)updateView {
	NSError *error = nil;
	NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:[[NSUserDefaults standardUserDefaults] URLForKey:@"filepath"].path error:&error];
	if (fileAttributes && !error) {
		NSDate *fileModDate = [fileAttributes fileModificationDate];
		NSDate *currentFileDate = [[NSUserDefaults standardUserDefaults] objectForKey:@"currentfiledate"];
		//Only update view if the file modify time has changed
		if (fileModDate != currentFileDate) {
			if ([[NSUserDefaults standardUserDefaults] URLForKey:@"filepath"] != nil) {
				NSURL *url = [[NSUserDefaults standardUserDefaults] URLForKey:@"filepath"];
				NSImage *img = [[NSImage alloc] initWithContentsOfURL:url];
				[mainImageView setImageScaling:NSImageScaleProportionallyUpOrDown];
				CGSize imgSize = img.size;
				[self.view.window setAspectRatio:imgSize];
				[[NSUserDefaults standardUserDefaults] setObject:fileModDate forKey:@"currentfiledate"];
				[mainImageView setImage:img];
			}
		}
	}
}

- (void)setRepresentedObject:(id)representedObject {
	[super setRepresentedObject:representedObject];

	// Update the view, if already loaded.
}

@end
