//
//  ViewController.h
//  imgDisplay
//
//  Created by Valtteri Koskivuori on 23/06/16.
//  Copyright © 2016 Valtteri Koskivuori. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

@interface ViewController : NSViewController <NSApplicationDelegate>{
	__weak IBOutlet NSImageView *mainImageView;
}
@property (weak) IBOutlet NSTextField *fileNameLabel;

@property (strong, nonatomic) AppDelegate *mainDelegate;


@end

