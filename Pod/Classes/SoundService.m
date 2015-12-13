//
//  SoundService.m
//  OneMoreRound
//
//  Created by lsease on 2/7/14.
//  Copyright (c) 2014 iParty Mobile. All rights reserved.
//

#import "SoundService.h"
#import <AVFoundation/AVFoundation.h>

#define kCustomSoundsPath   @"customSounds"

@interface SoundService()

@property(nonatomic,strong) AVAudioPlayer *player;
@property(nonatomic,strong) AVAudioPlayer *singlePlayer;

@end

@implementation SoundService

static SoundService *sharedService = nil;

#pragma mark Singleton Methods
+ (id)sharedService {
    @synchronized(self) {
        if (sharedService == nil){
            sharedService = [[self alloc] init];
            sharedService.soundQueue = [NSMutableArray array];
            
            //set this so sounds don't interrupt the system (music)
            [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil];
        }
        
    }
    
    
    return sharedService;
}

//pause the queue if there are sounds in the queue
//play the sound, recreating the player
//after the sound is finished, clean up the player by setting it to nil and playing from the queue if it exists
+(void)playSoundAtPath:(NSString*)path
{
    [[self sharedService] playSoundAtPath:path withQueuePlayer:NO withVolume:0];
}

+(void)playSoundAtPath:(NSString*)path withVolume:(float)volume
{
    [[self sharedService] playSoundAtPath:path withQueuePlayer:NO withVolume:volume];
}

//add a sound to the paths of sounds array
//if the queue is empty then create a player object and play the sound.
//after the sound is finished, clean up the player by setting it to nil or play a new sound from the queue
+(void)addSoundToQueueAtPath:(NSString*)path
{
    @synchronized(self)
    {
        SoundService * sharedService = [SoundService sharedService];
        [sharedService.soundQueue addObject:path];
        if(sharedService.soundQueue.count == 1)
        {
            [sharedService playSoundAtPath:path withQueuePlayer:YES withVolume:0];
        }
    }
}

//set the, pause the player and set a flag to stop new sounds from playing
-(void)pauseQueue
{
    [self.player pause];
}

//reset pause flag and continue playing the current player
-(void)resumeQueue
{
    [self.player play];
}


//play a specific sound by creating a new av player and assigning it to the player object
//pass in queuePlayer = true to assign to the queue player, otherwise assign to the single player
-(void)playSoundAtPath:(NSString*)path withQueuePlayer:(BOOL)isQueuePlayer withVolume:(float) volume
{

    NSURL * url = [SoundService urlForSoundNamed:path];
    
    if(url != nil){
        
        
        if(volume <= 0)
        {
            volume = kDefaultVolume;
        }
        
        if(!isQueuePlayer)
        {
            [self.player pause];
            self.singlePlayer= [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
            self.singlePlayer.delegate = sharedService;
            self.singlePlayer.volume = volume;
            [self.singlePlayer play];
        }
        else{
            self.player= [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
            self.player.delegate = sharedService;
            self.player.volume = volume;
            [self.player play];
        }
    }
}

+(NSURL*)urlForSoundNamed:(NSString*)name
{
    if([name rangeOfString:@"."].location == NSNotFound)
    {
        name = [NSString stringWithFormat:@"%@.caf",name];
    }
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath],name]];

    return url;
}

#pragma mark - AVAudioPlayerDelegate method
// singleAudioPlayer finished, clear it and resume the queue if present.
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag
{
    @synchronized(self)
    {
        if(player == self.singlePlayer)
        {
            self.singlePlayer = nil;
        }
        
        //remove the sound that played last and then start
        //a new one if it exists
        if(self.soundQueue.count > 0)
        {
            NSString * lastSound = [self.soundQueue objectAtIndex:0];
            [self.soundQueue removeObject:lastSound];
            
            if(self.soundQueue.count > 0)
            {
                NSString * nextSound = [self.soundQueue objectAtIndex:0];
                [self playSoundAtPath:nextSound withQueuePlayer:YES withVolume:0];
            }
        }
        else{
            self.player = nil;
        }
    }
}

-(BOOL)isPlaying
{
    return self.singlePlayer != nil && self.player != nil;
}


@end
