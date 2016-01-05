//
//  UITextField+Toolbar.m
//  Pods
//
//  Created by Logan Sease on 1/5/16.
//
//

#import "UITextField+Toolbar.h"

@implementation UITextField (Toolbar)

-(UIToolbar*)addToolbarWithLeftButton:(NSString*)lTitle withSelector:(SEL)lSelector andRightButton:(NSString*)rTitle withSelector:(SEL)rSelector andTarget:(id)target
{
    UIToolbar* toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, 50)];
    toolBar.barStyle = UIBarStyleBlackTranslucent;
    
    NSMutableArray * items = [NSMutableArray array];
    if(lTitle && lSelector)
    {
        [items addObject:[[UIBarButtonItem alloc]initWithTitle:lTitle style:UIBarButtonItemStylePlain target:target action:lSelector]];
    }
    
    [items addObject:[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
    
    if(rTitle && rSelector)
    {
        [items addObject:[[UIBarButtonItem alloc]initWithTitle:rTitle style:UIBarButtonItemStylePlain target:target action:rSelector]];
    }
    
    
    toolBar.items = items;
    [toolBar sizeToFit];
    
    self.inputAccessoryView = toolBar;
    return toolBar;
}

@end
