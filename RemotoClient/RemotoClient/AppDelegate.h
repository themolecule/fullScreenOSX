//
//  AppDelegate.h
//  RemotoClient
//
//  Created by Chris Healer on 2/24/16.
//  Copyright (c) 2016 Remoto, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

#import "WebKitWindow.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
    IBOutlet WebKitWindow   *webWindow;
//    IBOutlet NSWindow       *webWindow;
    IBOutlet WebView        *webView;
}

@property (nonatomic, retain) IBOutlet WebView *webView;

-(IBAction)fullScreen:(id)sender;

@end

