//
//  DatePickerTextField.h
//  Pods
//
//  Created by Logan Sease on 1/5/16.
//
//

#import <UIKit/UIKit.h>

@class DatePickerTextField;

@protocol DatePickerTextFieldDelegate <NSObject>
-(void)datePickerTextField:(DatePickerTextField*)field changed:(NSDate*)date;
@end


@interface DatePickerTextField : UITextField
@property(nonatomic,weak)IBOutlet id<DatePickerTextFieldDelegate> dateDelegate;
@property(nonatomic,strong)UIDatePicker * datePicker;
@property(nonatomic,strong)NSString * displayFormat;
@end
