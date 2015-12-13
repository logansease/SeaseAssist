//
//  SoundService.h
//  OneMoreRound
//
//  Created by lsease on 2/7/14.
//  Copyright (c) 2014 iParty Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

#define kDefaultVolume 0.8f

@interface SoundService : NSObject<AVAudioPlayerDelegate>

@property(nonatomic,strong) NSMutableArray * soundQueue;
@property BOOL ignoreNextSoundRequest;
@property(nonatomic,strong) NSArray * builtInSounds;
@property(nonatomic,strong) NSMutableArray * customSounds;

+ (id)sharedService;
+(void)playSoundAtPath:(NSString*)path;
+(void)playSoundAtPath:(NSString*)path withVolume:(float)volume;
+(void)addSoundToQueueAtPath:(NSString*)path;
-(void)pauseQueue;
-(void)resumeQueue;
-(BOOL)isPlaying;
+(NSURL*)urlForSoundNamed:(NSString*)name;

@end
