//
//  MailService.h
//  CatchPhrase
//
//  Created by lsease on 1/4/16.
//
//

#import <Foundation/Foundation.h>
#import <MessageUI/MFMailComposeViewController.h>

@protocol MailServiceCustomizer <NSObject>

//allows for customization
-(void)customizeController:(MFMailComposeViewController*)controller;
@end

@interface MailServiceAttachment : NSObject
@property(nonatomic,strong)NSString* fileName;
@property(nonatomic,strong)NSString * mimeType;
@property(nonatomic,strong)NSData * data;
@end

@interface MailService : NSObject<MFMailComposeViewControllerDelegate>

+ (id)sharedService;
-(void)emailTo:(NSArray*)emails withSubject:(NSString*)subject body:(NSString*)body attachments:(NSArray<MailServiceAttachment*>*)attachments fromVC:(UIViewController*)parent  andCompletion:(void(^)(BOOL success))handler;
@property(nonatomic,strong)	MFMailComposeViewController * mailController;
@property(nonatomic,weak)id<MailServiceCustomizer> customizer;
@property BOOL usesHtmlContent;
@end
