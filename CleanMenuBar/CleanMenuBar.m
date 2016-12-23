//
//  CleanMenuBar.m
//  CleanMenuBar
//
//  Created by Kevin Beaulieu on 12/22/16.
//  Copyright © 2016 Kevin M Beaulieu. All rights reserved.
//

#import "CleanMenuBar.h"

@implementation CleanMenuBar

+ (void) load {
    NSArray *appsToHide = @[
            @"co.atlasinformatics.Recall",
            @"com.todoist.mac.Todoist",
            @"com.knock.mac",
            @"net.matthewpalmer.Rocket",
            @"com.lastpass.LastPass"
    ];
    
    NSString *appID = [[NSBundle mainBundle] bundleIdentifier];
    if ([appsToHide containsObject:appID]) {
        NSLog(@"Will hide");
        [self hideFromStatusBar];
    }
}

+ (void)hideFromStatusBar {
    NSStatusBar *statusBar = [NSStatusBar systemStatusBar];
    
    NSPointerArray *statusItems = [statusBar valueForKey:@"_items"];
    for (int i = 0; i < statusItems.count; i++) {
        NSStatusItem *item = [statusItems pointerAtIndex:i];
        [statusBar removeStatusItem:item];
    }
}

@end
