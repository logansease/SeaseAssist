//
//  ValuePickerTextField.m
//  Pods
//
//  Created by Logan Sease on 1/5/16.
//
//

#import "ValuePickerTextField.h"



@implementation ValuePickerTextField

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
        UIPickerView * picker = [[UIPickerView alloc] init] ;
        self.inputView = picker;
        
        //retain a copy of the date picker if needed
        self.picker = picker;
        
        self.picker.delegate = self;
        self.picker.dataSource = self;
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(didStartEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
    }
    return self;
}

-(void)didStartEditing:(NSNotification *) notification
{
    if(self.currentValue.length > 0)
    {
        NSInteger index = [self.values indexOfObject:self.currentValue];
        if(index != NSNotFound)
        {
            [self.picker selectRow:index inComponent:0 animated:YES];
        }
        self.text = self.currentValue;
    }
    else
    {
        self.text = self.values.firstObject;
    }
}

#pragma mark range picker methods


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.values.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if(self.values.count > row)
    {
            return self.values[row];
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(self.values.count > row)
    {
        self.currentIndex = row;
        self.currentValue = self.values[row];
        self.text = self.currentValue;
        
        [self.valueDelegate valuePickerTextField:self changed:self.currentIndex withValue:self.currentValue];
    }

}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


@end
