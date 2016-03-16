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
  
  // Load white BG instead of green
  //self.view.backgroundColor = [UIColor whiteColor];
  //self.view.backgroundColor = [UIColor redColor];
  
  //self.carView.backgroundColor = [UIColor greenColor];
  //self.carView.backgroundColor = [UIColor clearColor];
  
  if (TRUE) {
    // Cycle background color change animation to demonstrate alpha channel
    
    self.view.backgroundColor = [UIColor greenColor];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:5.0];
    [UIView setAnimationRepeatCount:30];
    [UIView setAnimationRepeatAutoreverses:TRUE];
    self.view.backgroundColor = [UIColor whiteColor];
    [UIView commitAnimations];
  }
  
  AVAnimatorH264AlphaPlayer *player = self.carView;
  
//#if defined(DEBUG)
//  player.captureDir = [NSTemporaryDirectory() stringByAppendingPathComponent:@"Capture"];
//#endif // DEBUG
  
  // Note that the width x height of the view is not known at this point, because the view is being
  // loaded and it can be resized or rotated to fit initial app launch state.
  
//  NSLog(@"self.carView %dx%d", (int)player.bounds.size.width, (int)player.bounds.size.height);
  
  player.assetFilename = @"low_car_ANI_mix_30_main.m4v";

//  player.assetFilename = @"AlphaTest_mix.m4v";

//  player.assetFilename = @"MultiTest_mix.m4v";
  
//  player.assetFilename = @"MatrixTest_mix.m4v";
  
//  player.assetFilename = @"RGBFrames32BPP_mix.m4v";
  
//  player.assetFilename = @"Colorbands_mix.m4v";
  
//  player.assetFilename = @"GrayGradient_mix.m4v";

//  player.assetFilename = @"GrayAlphaBlend_mix.m4v";
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(animatorPreparedNotification:)
                                               name:AVAnimatorPreparedToAnimateNotification
                                             object:player];

  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(animatorStoppedNotification:)
                                               name:AVAnimatorDidStopNotification
                                             object:player];
  
  [player prepareToAnimate];
}

// The prepared callback is invoked once the asset has been opened and the first frame
// has been loaded into memory. Note that this prepared callback can be invoked multiple
// times in the case looping the media playback is implemented.

- (void)animatorPreparedNotification:(NSNotification*)notification {
  AVAnimatorH264AlphaPlayer *player = notification.object;
  
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

// Invoked after animation playback has stopped

- (void)animatorStoppedNotification:(NSNotification*)notification {
  NSLog(@"animatorStoppedNotification");

  // Kick off another animation cycle by doing a prepare operation which will open
  // the asset resource and load the first frame of data. An asset based player
  // needs to be reinitialized each time it is played.
  
  [self.carView prepareToAnimate];
}

@end
