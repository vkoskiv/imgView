//
//  AppDelegate.m
//  imgDisplay
//
//  Created by Valtteri Koskivuori on 23/06/16.
//  Copyright © 2016 Valtteri Koskivuori. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
	// Insert code here to initialize your application
}

- (IBAction)openPanel:(id)sender {
	NSOpenPanel *filePanel = [NSOpenPanel openPanel];
	[filePanel setCanChooseFiles:YES];
	[filePanel setCanChooseDirectories:NO];
	[filePanel setCanCreateDirectories:NO];
	[filePanel setTitle:@"Choose an image file"];
	[filePanel setAllowedFileTypes:@[@"png", @"bmp"]];
	[filePanel runModal];
	[[NSUserDefaults standardUserDefaults] setURL:[[filePanel URLs] objectAtIndex:0] forKey:@"filepath"];
	
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
	// Insert code here to tear down your application
	[[NSUserDefaults standardUserDefaults] removeObjectForKey:@"filepath"];
}

@end
