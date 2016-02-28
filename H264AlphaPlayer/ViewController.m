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

@property (nonatomic, retain) AVAnimatorH264AlphaPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  AVAnimatorH264AlphaPlayer *player = [AVAnimatorH264AlphaPlayer aVAnimatorH264AlphaPlayerWithFrame:self.view.frame];
  
  self.player = player;
  
  player.assetFilename = @"low_car_ANI_mix_30_main.m4v";
  
  [player prepareToAnimate];
  
  [self.view addSubview:player];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
