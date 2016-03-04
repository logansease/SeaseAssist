//
//  UISegmentedControl+Helpers.m
//  Immunization Tracker
//
//  Created by Logan Sease on 2/12/16.
//  Copyright © 2016 Qonceptual. All rights reserved.
//

#import "UISegmentedControl+Helpers.h"

@implementation UISegmentedControl (Helpers)
-(BOOL)setSelectedSegmentNamed:(NSString*)name
{
    NSArray * titles = [self allTitles];
    NSInteger index = [titles indexOfObject:name];
    if(name.length == 0 || index == NSNotFound)
    {
        self.selectedSegmentIndex = UISegmentedControlNoSegment;
        return NO;
    }
    else{
        self.selectedSegmentIndex = index;
        return YES;
    }
}
-(NSArray*)allTitles
{
    NSMutableArray * titles = [NSMutableArray array];
    for(int i = 0 ; i < self.numberOfSegments; i++)
    {
        [titles addObject:[self titleForSegmentAtIndex:i]];
    }
    return titles;
}

-(NSString*)selectedSegementTitle
{
    if(self.selectedSegmentIndex == UISegmentedControlNoSegment)
    {
        return nil;
    }
    return [self titleForSegmentAtIndex:self.selectedSegmentIndex];
}

@end
