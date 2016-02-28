//
//  AVAnimatorH264AlphaPlayer.h
//
//  Created by Moses DeJong on 2/27/16.
//
//  License terms defined in License.txt.
//
// The AVAnimatorH264AlphaPlayer class provides a self contained player
// for a mixed H264 video that contains both RGB + Alpha channels of
// data encoded as interleaved frames. This class extends GLKView
// and provides functionality that decodes video data from a resource
// file or regular file and then sends the video data to the view.

#import "AVAssetConvertCommon.h"

#if defined(HAS_AVASSET_READ_COREVIDEO_BUFFER_AS_TEXTURE)

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface AVAnimatorH264AlphaPlayer : GLKView

// static ctor : create view that has the screen dimensions
+ (AVAnimatorH264AlphaPlayer*) aVAnimatorH264AlphaPlayer;

// static ctor : create view with the given dimensions
+ (AVAnimatorH264AlphaPlayer*) aVAnimatorH264AlphaPlayer:(CGRect)viewFrame;

@end

#endif // HAS_AVASSET_READ_COREVIDEO_BUFFER_AS_TEXTURE
