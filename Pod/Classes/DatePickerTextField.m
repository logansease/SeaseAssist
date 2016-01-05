//
//  DatePickerTextField.m
//  Pods
//
//  Created by Logan Sease on 1/5/16.
//
//

#import "DatePickerTextField.h"
#import "NSDate+Helpers.h"

@implementation DatePickerTextField

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
        UIDatePicker * datePicker = [[UIDatePicker alloc] init] ;
        datePicker.datePickerMode = UIDatePickerModeDate;
        datePicker.date = [NSDate date];
        self.inputView = datePicker;
        
        //retain a copy of the date picker if needed
        self.datePicker = datePicker;
        
        //add a call back to update the text field when the date picker changes
        [datePicker addTarget:self action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged];
        
        self.displayFormat = @"MM/dd/yyyy";
    }
    return self;
}

-(void)dateChanged:(id)sender
{
    [self.dateDelegate datePickerTextField:self changed:self.datePicker.date];
    self.text = [self.datePicker.date dateToStringWithFormat:self.displayFormat];
}

@end
