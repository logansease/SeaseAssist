//
//  ImagePickerHelper.m
//  Immunization Tracker
//
//  Created by Logan Sease on 3/3/16.
//  Copyright © 2016 Qonceptual. All rights reserved.
//

#import "ImagePickerHelper.h"
#import "UIViewController+Top.h"
#import "NSThread+Helpers.h"
#import "UIViewController+Presentation.h"
#import "UIAlertController+Helpers.h"

@interface ImagePickerHelper()
@property (nonatomic, copy) void (^completionHandler)(UIImage* result);
@property(nonatomic,strong)UIImagePickerController *imagePickerController;
@end

@implementation ImagePickerHelper

static ImagePickerHelper *sharedService = nil;

#pragma mark Singleton Methods
+ (id)sharedInstance {
    @synchronized(self) {
        if (sharedService == nil){
            sharedService = [[self alloc] init];
        }
        
    }
    return sharedService;
}

-(void)selectImageFrom:(UIViewController*)source withCompletion:(void(^)(UIImage* image))handler
{
    [UIAlertController showDialogWithTitle:@"Select Source" andMessage:nil from:source andActions:@[@"Camera", @"Camera Roll", @"Cancel"] completionHandler:^(NSInteger selected) {
        if(selected == 0)
        {
            [self selectImageFrom:source ofType:UIImagePickerControllerSourceTypeCamera andCompletion:handler];
        }
        else if(selected == 1)
        {
            [self selectImageFrom:source ofType:UIImagePickerControllerSourceTypePhotoLibrary andCompletion:handler];
        }
        else{
            handler(nil);
        }
    }];
}

-(UIImagePickerController*)selectImageFrom:(UIViewController*)source ofType:(UIImagePickerControllerSourceType)type andCompletion:(void(^)(UIImage* image))handler
{
    if(![UIImagePickerController isSourceTypeAvailable:type])
    {
        handler(nil);
        return nil;
    }
    
    self.completionHandler = handler;
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.delegate = self;
    imagePickerController.sourceType = type;
    
    self.imagePickerController = imagePickerController;
    
    if(type == UIImagePickerControllerSourceTypeCamera)
    {
        imagePickerController.showsCameraControls = YES;
    }
    
    if(self.customizer)
    {
        [self.customizer customizeImageController:self.imagePickerController];
    }
    
    [UIViewController present:imagePickerController on:source];
    
    return imagePickerController;
}



#pragma mark - UIImagePickerControllerDelegate

// This method is called when an image has been chosen from the library or taken from the camera.
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //set image to preview
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [NSThread mainThread:^{
        self.completionHandler(image);
        self.completionHandler = nil;
        [self.imagePickerController dismissViewControllerAnimated:YES completion:^{
            self.imagePickerController = nil;
        }];
    }];
}


- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [NSThread mainThread:^{
        self.completionHandler(nil);
        self.completionHandler = nil;
        [self.imagePickerController dismissViewControllerAnimated:YES completion:^{
            self.imagePickerController = nil;
        }];
    }];
}

@end
