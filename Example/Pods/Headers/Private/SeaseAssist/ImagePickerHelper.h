//
//  ImagePickerHelper.h
//  Immunization Tracker
//
//  Created by Logan Sease on 3/3/16.
//  Copyright © 2016 Qonceptual. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ImagePickerCustomizer <NSObject>
//allows for customization
-(void)customizeImageController:(UIImagePickerController*)controller;
@end

@interface ImagePickerHelper : NSObject<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

+ (id)sharedInstance;
-(UIImagePickerController*)selectImageFrom:(UIViewController*)source ofType:(UIImagePickerControllerSourceType)type andCompletion:(void(^)(UIImage* image))handler;
-(void)selectImageFrom:(UIViewController*)source withCompletion:(void(^)(UIImage* image))handler;
@property(nonatomic,weak)id<ImagePickerCustomizer> customizer;

@end

