//
//  UIView+FrameAdjust.m
//  Conundrums
//
//  Created by lsease on 1/9/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIView+FrameAdjust.h"

@implementation UIView (FrameAdjust)
-(void)adjustFrameXOffset:(float)horizontal yOffset:(float)vertical hOffset:(float)height wOffset:(float)width
{
    self.frame = CGRectMake(self.frame.origin.x + horizontal, self.frame.origin.y + vertical, self.frame.size.width + width, self.frame.size.height + height);
}
@end
