//
//  WebKitWindow.m
//  RemotoClient
//
//  Created by Chris Healer on 2/24/16.
//  Copyright (c) 2016 Remoto, Inc. All rights reserved.
//

#import "WebKitWindow.h"


@implementation WebKitWindow

-(id)	initWithContentRect: (NSRect)contentRect
                styleMask: (NSUInteger)mask
                  backing: (NSBackingStoreType)backingType
                    defer: (BOOL)defer
{
    if(self = [super	initWithContentRect: contentRect
                               styleMask: NSBorderlessWindowMask
                                 backing: backingType
                                   defer: defer])
    {
        [[NSNotificationCenter defaultCenter]
         addObserver: self
         selector: @selector(windowDidResize:)
         name: NSWindowDidResizeNotification
         object: self];
    }
        
    return self;
}

- (BOOL) canBecomeKeyWindow
{
    return YES;
}


-(void) windowDidResize:(NSNotification*)note
{
    [self display];
}


@end