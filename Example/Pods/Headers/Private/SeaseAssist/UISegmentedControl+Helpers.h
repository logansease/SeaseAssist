//
//  UISegmentedControl+Helpers.h
//  Immunization Tracker
//
//  Created by Logan Sease on 2/12/16.
//  Copyright © 2016 Qonceptual. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISegmentedControl (Helpers)
-(BOOL)setSelectedSegmentNamed:(NSString*)name;
-(NSArray*)allTitles;
-(NSString*)selectedSegementTitle;
@end
