//
//  ValuePickerTextField.h
//  Pods
//
//  Created by Logan Sease on 1/5/16.
//
//

#import <UIKit/UIKit.h>

@class ValuePickerTextField;

@protocol ValuePickerTextFieldDelegate <NSObject>
-(void)valuePickerTextField:(ValuePickerTextField*)field changed:(NSInteger)index withValue:(NSString*)value;
@end


@interface ValuePickerTextField : UITextField<UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic,weak)IBOutlet id<ValuePickerTextFieldDelegate> valueDelegate;
@property(nonatomic,strong)UIPickerView * picker;
@property(nonatomic,strong)NSArray*values;
@property(nonatomic,strong)NSString*currentValue;
@property(nonatomic,strong)NSString* customOptionText;
@property NSInteger currentIndex;

@end

