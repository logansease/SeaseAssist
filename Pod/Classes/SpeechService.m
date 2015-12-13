//
//  SpeechService.m
//  CatchPhrase
//
//  Created by lsease on 2/7/14.
//
//

#import "SpeechService.h"
#import <UIKit/UIKit.h>


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation SpeechService

static SpeechService *sharedService = nil;

#pragma mark Singleton Methods
+ (id)sharedService {
    @synchronized(self) {
        if (sharedService == nil){
            sharedService = [[self alloc] init];
            
                sharedService.speechSynth = [[AVSpeechSynthesizer alloc]init];
            
        }
        
    }
    return sharedService;
}

-(void)speakText:(NSString*)text
{
    if([self.speechSynth isSpeaking])
    {
        [self.speechSynth stopSpeakingAtBoundary:AVSpeechBoundaryWord];
    }
    
    if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0") )
    {
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[text stringByReplacingOccurrencesOfString:@"\n" withString:@"..."]];
        
        if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.5"))
        {
            [utterance setRate:.5f];
        }
        else if(SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0") )
        {
            [utterance setRate:.08f];
        }
        
        else
        {
            [utterance setRate:.18f];
        }
        
        [utterance setVolume:.7f];
        //utterance.voice = [ AVSpeechSynthesisVoice voiceWithLanguage:@"en"];
        [self.speechSynth speakUtterance:utterance];
    }

}

+(BOOL)isSpeaking
{
    SpeechService * service = [SpeechService sharedService];
    return [service.speechSynth isSpeaking];
}

@end
