//
//  ViewController.m
//  UIControlDemo
//
//  Created by Tom Abbott on 1/30/13.
//  Copyright (c) 2013 Tom Abbott. All rights reserved.
//

#import "ViewController.h"
#import "BCEventLogger.h"
#import "BCVideo.h"
#import "BCQueuePlayer.h"
#import "CustomUIControls.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self configurePlayerWithVideo];
}

- (void)configurePlayerWithVideo
{
    //Create a video from URL
    BCVideo *video = [BCVideo videoWithURL:[NSURL URLWithString:@"http://8806a5d9324faf9f31fb-31a5eb2af178214dc2ca6ce50f208bb5.iosr.cf1.rackcdn.com/sled_-_handmade_goods_1280x720.mp4"] properties:nil];
    
    //Initialize with a video
    self.player = [[BCQueuePlayer alloc] initWithVideo:video];
    
    //Add player to view
    self.player.view.frame = self.mainView.frame;
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [self.mainView addSubview:self.player.view];
    
    //Add UI Controls
    self.controls = [[CustomUIControls alloc] initWithEventEmitter:self.player.playbackEmitter view:self.player.view];
    
    //Play on Player
    [self.player play];
}

@end
