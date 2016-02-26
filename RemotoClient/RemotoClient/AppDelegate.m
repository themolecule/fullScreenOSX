//
//  AppDelegate.m
//  RemotoClient
//
//  Created by Chris Healer on 2/24/16.
//  Copyright (c) 2016 Remoto, Inc. All rights reserved.
//

#import "AppDelegate.h"
//#import <OpenGL/CGLMacro.h>

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

@synthesize webView;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (void)awakeFromNib {

    NSURL *url = 0;
    NSURL *urlTest = 0;
    
    //if a url is specified on the command line, use it
    NSArray *parameters = [[NSProcessInfo processInfo] arguments];
    for (int i=0;i<parameters.count;i++)
    {
        urlTest = [NSURL URLWithString:parameters[i]];
        if (urlTest && urlTest.scheme && urlTest.host)
            url = urlTest;
    }
    
    //or, look in the contents of url.txt in the app bundle
    if (!url)
    {
        NSString *resourcesPath = [[NSBundle mainBundle] resourcePath];
        NSString *urlFile = [resourcesPath stringByAppendingString:@"/url.txt"];
        NSString *urlFileContents = [NSString stringWithContentsOfFile:urlFile encoding:NSUTF8StringEncoding error:nil];
        NSArray *urls = [urlFileContents componentsSeparatedByString:@"\n"];
        for (NSString *u in urls) {
            urlTest = [NSURL URLWithString:u];
            if (urlTest && urlTest.scheme && urlTest.host)
                url = urlTest;
        }
    }
    
    //or, fail over to the homepage
    if (!url)
        url = [NSURL URLWithString:@"http://themolecule.com"];
    
    NSLog(@"Loading url: %@\n",url);
    
    [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
    
    [self fullScreen:NULL];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)theApplication {
    return YES;
}

- (IBAction)fullScreen:(id)sender;
{
//    if (CGCaptureAllDisplays() != kCGErrorSuccess) {
//        NSLog( @"Couldn't capture the main display!" );
    // Note: you'll probably want to display a proper error dialog here
//    }
    
//    int windowLevel = CGShieldingWindowLevel();
    
    NSRect w;
    NSArray *s = [NSScreen screens];
    for(int i=0;i<s.count;i++)
        w = NSUnionRect(w,[s[i] frame]);
    //NSLog(@"Rect %@", NSStringFromRect(w));
    
    //NSScreen *screen = [NSScreen mainScreen];
    //NSRect winFrame = [screen frame];
    //[webWindow setFrame: winFrame display: YES animate: NO];
    
    [webWindow setFrame: w display: YES animate: NO];
    [webWindow setHasShadow:NO];
    [webWindow setAlphaValue:1.0];
    [webWindow setBackgroundColor:[NSColor clearColor]];
    [webWindow setOpaque:YES];
    //[webWindow setDelegate:self];
    [webWindow setLevel:NSScreenSaverWindowLevel-1];
    //[webWindow setLevel:windowLevel];

//    [webView enterFullScreenMode:NULL withOptions:NULL];
//    [webView setFrame:w];
    
    // hide the cursor
    CGDisplayHideCursor (kCGDirectMainDisplay);
}

@end
