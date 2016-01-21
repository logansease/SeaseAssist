//
//  UIView+Search.m
//  Conundrums
//
//  Created by lsease on 1/18/16.
//  Copyright © 2016 iParty Mobile. All rights reserved.
//

#import "UIView+Search.h"

@implementation UIView (Search)
-(NSArray*)searchForSubviewsOfType:(Class)searchClass
{
    NSMutableArray * result = [NSMutableArray array];
    
    for(UIView * v in self.subviews)
    {
        if([v isKindOfClass:searchClass])
        {
            [result addObject:v];
        }
        
        NSArray * children = [v searchForSubviewsOfType:searchClass];
        if(children.count > 0)
        {
            [result addObjectsFromArray:children];
        }
    }
    
    return result;
}
@end
