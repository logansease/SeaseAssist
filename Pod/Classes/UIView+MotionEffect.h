//
//  UIView+MotionEffect.h
//  CatchPhrase
//
//  Created by lsease on 1/16/14.
//
//

#import <UIKit/UIKit.h>

//constants defined for different layer types
#define kMotionBackgroundLayerOffset -25.0
#define kMotionContentLayerOffset 75.0
#define kMotionInterfaceLayerOffset 25.0

@interface UIView (MotionEffect)

//standard motion effect add
-(void)addMotionEffectsWithOffset:(float)offset;

//add motion effect in the vertical direction only
-(void)addVerticalMotionEffectsWithOffset:(float)offset;

//for a fullscreen image view, you would need to resize the view to allow a motion effect to work
//without showing the edges of the image during the motion effect.
-(void)resizeFullScreenViewAndAddMotionEffectsWithOffset:(float)offset;

//for a view that is full screen horizontally, we will resize it a bit horizontally to allow for a
//full range motion effect without cropping the image off during motion.
//this is an alternative to using a vertical only motion effect.
-(void)resizeHorizontallyAndAddMotionEffectsWithOffset:(float)offset;

@end
