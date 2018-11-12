//
//  MailService.m
//  CatchPhrase
//
//  Created by lsease on 1/4/16.
//
//

#import "MailService.h"
#import "UIViewController+Top.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "UIViewController+Presentation.h"

@implementation MailServiceAttachment
@end

@interface MailService()

@property (nonatomic, copy) void (^completionHandler)(BOOL result, NSError * error);

@end

@implementation MailService
static MailService *sharedService = nil;

#pragma mark Singleton Methods
+ (id)sharedService {
    @synchronized(self) {
        if (sharedService == nil){
            sharedService = [[self alloc] init];
        }
        
    }
    return sharedService;
}

-(void)emailTo:(NSArray*)emails withSubject:(NSString*)subject body:(NSString*)body attachments:(NSArray<MailServiceAttachment*>*)attachments fromVC:(UIViewController*)parent   andCompletion:(void(^)(BOOL success, NSError * error))handler
{
    //validate we can send mail
    if(![MFMailComposeViewController canSendMail]){
        if(handler)
        {
            handler(NO, [[NSError alloc]initWithDomain:@"MailService" code:0 userInfo:@{@"message": @"You do not have email set up on this unit. Please configure your email program."}]);
        }
    
        return;
    }
    
    //init the mail controller
    self.mailController =  [[MFMailComposeViewController alloc] init];
    self.mailController.mailComposeDelegate = self;
    
    //add attachments
    for(MailServiceAttachment * attachment in attachments)
    {
        [self.mailController addAttachmentData:attachment.data mimeType:attachment.mimeType fileName:attachment.fileName];
    }
    
    [self.mailController setToRecipients:emails];
    [self.mailController setSubject:subject];
    [self.mailController setMessageBody:body isHTML:self.usesHtmlContent];
    
    if(self.customizer)
    {
        [self.customizer customizeController:self.mailController];
    }
    
    if(parent)
    {
        if(parent.presentingViewController)
        {
            [parent dismissViewControllerAnimated:NO completion:nil];
        }
        [parent presentViewController:self.mailController animated:YES completion:nil];
    }
    else{
        [UIViewController present:self.mailController on:parent];
    }
    
    //retain the handler
    self.completionHandler = handler;
}


/**
 * this is the delegate method called when the mail controller completes. If there is a failure, it will show it
 */
- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    NSLog(@"Dismiss");
    switch (result) {
        case MFMailComposeResultCancelled:
            [self callSuccess:NO error:nil];
            break;
        case MFMailComposeResultSaved:
            [self callSuccess:NO error:nil];
            break;
        case MFMailComposeResultSent:
        {
            [self callSuccess:YES error: nil];
            break;
        }
            
            //show the failure notification
        case MFMailComposeResultFailed:
        {
            [self callSuccess:NO error: error];
            break;
        }
    }
    
    [self.mailController dismissViewControllerAnimated:YES completion:^{
        self.mailController = nil;
        self.completionHandler = nil;
    }];

}

-(void)callSuccess:(BOOL)success error:(NSError*)error
{
    if(self.completionHandler)
    {
        self.completionHandler(success, error);
    }

}




@end
