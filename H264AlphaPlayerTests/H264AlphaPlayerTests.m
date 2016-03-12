//
//  H264AlphaPlayerTests.m
//  H264AlphaPlayerTests
//
//  Created by Mo DeJong on 2/27/16.
//  Copyright © 2016 HelpURock Software. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AVAnimatorH264AlphaPlayer.h"

@interface AVAnimatorH264AlphaPlayer ()

+ (uint32_t) timeIntervalToFrameOffset:(CFTimeInterval)elapsed
                                   fps:(CFTimeInterval)fps;

@end

@interface H264AlphaPlayerTests : XCTestCase

@end

@implementation H264AlphaPlayerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

// Test measurement of frame offset based on elapsed time

- (void)testFrameTime1 {
  CFTimeInterval elapsed = 0.0;
  CFTimeInterval fps = 2.0;
  uint32_t frameOffset;

  frameOffset = [AVAnimatorH264AlphaPlayer timeIntervalToFrameOffset:elapsed fps:fps];
  
  XCTAssert(frameOffset == 1);
}

- (void)testFrameTime2 {
  CFTimeInterval elapsed = 0.1;
  CFTimeInterval fps = 2.0;
  uint32_t frameOffset;
  
  frameOffset = [AVAnimatorH264AlphaPlayer timeIntervalToFrameOffset:elapsed fps:fps];
  
  XCTAssert(frameOffset == 1);
}

- (void)testFrameTime3 {
  CFTimeInterval elapsed = 0.49;
  CFTimeInterval fps = 2.0;
  uint32_t frameOffset;
  
  frameOffset = [AVAnimatorH264AlphaPlayer timeIntervalToFrameOffset:elapsed fps:fps];
  
  XCTAssert(frameOffset == 1);
}

- (void)testFrameTime4 {
  CFTimeInterval elapsed = 0.50;
  CFTimeInterval fps = 2.0;
  uint32_t frameOffset;
  
  frameOffset = [AVAnimatorH264AlphaPlayer timeIntervalToFrameOffset:elapsed fps:fps];
  
  XCTAssert(frameOffset == 1);
}

- (void)testFrameTime5 {
  CFTimeInterval elapsed = 0.51;
  CFTimeInterval fps = 2.0;
  uint32_t frameOffset;
  
  frameOffset = [AVAnimatorH264AlphaPlayer timeIntervalToFrameOffset:elapsed fps:fps];
  
  XCTAssert(frameOffset == 1);
}

- (void)testFrameTime6 {
  CFTimeInterval elapsed = 0.6;
  CFTimeInterval fps = 2.0;
  uint32_t frameOffset;
  
  frameOffset = [AVAnimatorH264AlphaPlayer timeIntervalToFrameOffset:elapsed fps:fps];
  XCTAssert(frameOffset == 1);
}

// Rounds up to frame 2 at this point

- (void)testFrameTime7 {
  CFTimeInterval elapsed = 0.75;
  CFTimeInterval fps = 2.0;
  uint32_t frameOffset;
  
  frameOffset = [AVAnimatorH264AlphaPlayer timeIntervalToFrameOffset:elapsed fps:fps];
  XCTAssert(frameOffset == 2);
}

//- (void)testPerformanceExample {
//    // This is an example of a performance test case.
//    [self measureBlock:^{
//        // Put the code you want to measure the time of here.
//    }];
//}

@end
