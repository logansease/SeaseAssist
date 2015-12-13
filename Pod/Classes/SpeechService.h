//
//  SpeechService.h
//  CatchPhrase
//
//  Created by lsease on 2/7/14.
//
// ios 7.0+

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface SpeechService : NSObject

+ (id)sharedService;
+(BOOL)isSpeaking;
-(void)speakText:(NSString*)text;

@property(nonatomic,strong)AVSpeechSynthesizer * speechSynth;

@end
