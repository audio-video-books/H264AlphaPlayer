//
//  ViewController.m
//  H264AlphaPlayer
//
//  Created by Mo DeJong on 2/27/16.
//  Copyright © 2016 HelpURock Software. All rights reserved.
//

#import "ViewController.h"

#import "AVAnimatorH264AlphaPlayer.h"

@interface ViewController ()

@property (nonatomic, retain) IBOutlet AVAnimatorH264AlphaPlayer *carView;

@end

@implementation ViewController

- (void) dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  NSAssert(self.carView, @"carView");
  
  NSAssert(self.carView.superview != nil, @"superview");
  
  AVAnimatorH264AlphaPlayer *player = self.carView;
  
  // Note that the width x height of the view is not known at this point, because the view is being
  // loaded and it can be resized or rotated to fit initial app launch state.
  
//  NSLog(@"self.carView %dx%d", (int)player.bounds.size.width, (int)player.bounds.size.height);
  
  player.assetFilename = @"low_car_ANI_mix_30_main.m4v";
 
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(animatorPreparedNotification:)
                                               name:AVAnimatorPreparedToAnimateNotification
                                             object:player];
  
  [player prepareToAnimate];
}

// Invoked once a specific media object is ready to animate.

- (void)animatorPreparedNotification:(NSNotification*)notification {
  AVAnimatorH264AlphaPlayer *player = notification.object;
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:AVAnimatorPreparedToAnimateNotification
                                                object:player];
  
  AVAssetFrameDecoder *frameDecoder = (AVAssetFrameDecoder*) player.frameDecoder;
  NSString *file = player.assetFilename;
  
  // Size of movie is available now
  
  CGSize videoSize = CGSizeMake(frameDecoder.width, frameDecoder.height);
  
  NSLog(@"animatorPreparedNotification %@ : videoSize %d x %d", file, (int)videoSize.width, (int)videoSize.height);
  
//  NSLog(@"self.carView origin %d,%d", (int)self.carView.frame.origin.x, (int)self.carView.frame.origin.y);
  
  NSLog(@"self.carView : %d x %d", (int)self.carView.frame.size.width, (int)self.carView.frame.size.height);
  
  [self.carView startAnimator];
  
  return;
}

@end
