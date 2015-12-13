# SeaseAssist

[![CI Status](http://img.shields.io/travis/Logan Sease/SeaseAssist.svg?style=flat)](https://travis-ci.org/Logan Sease/SeaseAssist)
[![Version](https://img.shields.io/cocoapods/v/SeaseAssist.svg?style=flat)](http://cocoapods.org/pods/SeaseAssist)
[![License](https://img.shields.io/cocoapods/l/SeaseAssist.svg?style=flat)](http://cocoapods.org/pods/SeaseAssist)
[![Platform](https://img.shields.io/cocoapods/p/SeaseAssist.svg?style=flat)](http://cocoapods.org/pods/SeaseAssist)

## Requirements
ios 7+

## Installation

SeaseAssist is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SeaseAssist"
```

And import the following Header file
```ruby
#import "SeaseAssist.h"
```

## Info

This library is founded on the basis that commonly performed tasks, which take several lines of code to write should be encompased into simple methods, either using class extensions or services, that can be written in a single line of code. Thus reducing code redundancy and increasing code readibility.

In this package you will find the following:

- A collection of NSDate Helpers
- Button and View helpers to make good looking views easily and handle things like rounding, borders and more
- An Array and Dictionary extension to convert to and from JSON
- AN HTTP Request class to easily send api requests without any non-standard libraries
- A UIImage View extension to load images from a URL and cache the image locally.
- A Validation Helper class for NSString
- String and NSData cryptography Helpers
- NSThread Helpers to easily run blocks on the main and background threads
- A Speech Service for speech to text.
- UIAlertController Helpers
- Image Helpers for things like blurring and resizing
- Animation and Motion Effects Helpers
- A View Controller helper that can recursively determine the visible view controller from anywhere in your application
- A new helper that shows text on screen for a short time, like an Android "Toast"
- Network Reachability Helper
- An Event Counter to track the number of times an event has occurred during the life of an app, or daily.
- And more...

I plan to add more extensive documentation in the near future.


Enjoy! Please feel free to fork and contribute to this repo!


## Author

Logan Sease, lsease@gmail.com

## License

SeaseAssist is available under the MIT license. See the LICENSE file for more info.


#UICLASSES

##CleanButton
A modern button with a nice clean rounded border, an empty background and some text

##GlossyButton
A button with a gradient filled background matching the button's Tint Color

##RoundedView
A Round View

#SERVICES

##EventCounterService
A class to track events throughout the life of the app, or daily events
### methods
+(NSUInteger)addCountForEvent:(NSString*)event count:(NSInteger)add;
+(NSUInteger)addCountForEvent:(NSString*)event;
+(void)resetCountForEvent:(NSString*)event;
+(NSUInteger)checkCountForEvent:(NSString*)event;
+(NSUInteger)checkDailyEventCount:(NSString*)dailyEvent;
+(NSUInteger)addDailyEventCount:(NSString*)dailyEvent;
+(NSUInteger)addCountForDailyEvent:(NSString*)dailyEvent count:(NSInteger)count;

##Sound Service
A service to play sounds and maintain a queue
###Methods
+ (id)sharedService;
+(void)playSoundAtPath:(NSString*)path;
+(void)playSoundAtPath:(NSString*)path withVolume:(float)volume;
+(void)addSoundToQueueAtPath:(NSString*)path;
-(void)pauseQueue;
-(void)resumeQueue;
-(BOOL)isPlaying;
+(NSURL*)urlForSoundNamed:(NSString*)name;

##SpeechService
Simple Text to Speech with the Siri API
+ (id)sharedService;
+(BOOL)isSpeaking;
-(void)speakText:(NSString*)text;

#NETWORKING

##HTTPRequest
A helper class to make http requests asynchronously in one line without the need for any 3rd party frameworks
+(void)jsonRequestToUrl:(NSString*)urlString withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler;

+(void)httpRequestToUrl:(NSString*)urlString  withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler;

+(NSString*)addParameters:(NSDictionary*)urlParams toUrl:(NSString*)url;

##Reachability Helpers
Find our internet connection status.
+ (BOOL)connected;

#CLASS EXTENSIONS

##Json Serialization and Deserialization

###NSDictionary
-(NSString*)toJsonString;
+(NSDictionary*)fromJsonString:(NSString*)json;

###NSArray
-(NSString*)toJsonString;
+(NSArray*)fromJsonString:(NSString*)json;

##NSDate Helpers
-(NSDate*)beginningOfWeek;
-(NSDate*)endOfWeek;

-(NSDate*)beginningOfMonth;
-(NSDate*)endOfMonth;

-(NSDate*)beginningOfYear;
-(NSDate*)endOfYear;
-(NSDate*)dateWithCurrentYear;

-(NSString*)dateToStringWithFormat:(NSString*)format;

-(NSDate*)dateAtEndOfDay;
-(NSDate*)dateWithoutTime;
-(NSDate*)timeValue;
-(BOOL)isOnBeforeOrToday;
-(BOOL)isToday;
-(BOOL)isBeforeToday;

-(BOOL)isBetween:(NSDate*)startDate and:(NSDate*)endDate;
-(NSDate*)dateByAdvancingMonths:(NSInteger)monthCount;
-(BOOL)isAfterDate:(NSDate*)secondDate;
-(BOOL)isBeforeDate:(NSDate*)secondDate;


##NSArray Helpers
- (void)shuffle;

##NSString Helpers
-(NSInteger)occurancesOfString:(NSString*)test;

##NSString validation
-(BOOL)isValidEmail:(BOOL)laxValidation;
-(BOOL)isValidEmail;
-(BOOL)isDigitOfLength:(NSInteger)length;

##Encryption Helpers
###NSData
-(NSData *) aesEncryptedDataWithKey:(NSData *) key;
-(NSString*)toBase64;

###NSString
- (NSData *) sha256;
- (NSString *) stringFromMD5;
- (NSString*)encryptWithKey:(NSString*)key;

##NSThread Helpers
Run blocks in the main or background threads with ease
+(void)mainThread:(void (^)())main;
+(void)backgroundThread:(void (^)())background;

##Device Identifiers
Since apple now longer gives access to device level Identifier information, this is another way to get an Identifier based on a hash of the mac address
- (NSString *) uniqueDeviceIdentifier;
- (NSString *) uniqueGlobalDeviceIdentifier;

##Alerts

###MBProgressHUD+Singleton
An extension to MBProgressHUD to show a loading dialog singleton without needing to add it to your view or set it up.
+(void)showWithTitle:(NSString*)title;
+(void)hide;

###UIAlertController
Show an alert controller with actions and get notified what action was chosen with a single line
+(void)showAlertWithTitle:(NSString*)title andMessage:(NSString*)message from:(UIViewController*)controller;
+(void)showDialogWithTitle:(NSString*)title andMessage:(NSString*)message from:(UIViewController*)controller andActions:(NSArray<NSString*>*)buttonTitles completionHandler:(void (^)(NSInteger selected))handler;

###UIAlertView
+(void)showWithTitle:(NSString*)title andMessage:(NSString*)message;

###UILabel+Message
Show a quick "Toast" on screen for a desired amount of time
+(void)showMessage:(NSString*)message ofSize:(float)fontSize ofColor:(UIColor*)color inView:(UIView*)view forDuration:(float)seconds;

##Images

###UIImage Helpers
Add a gassian Blur of the desired amount of pixels
-(UIImage*)blurredImage:(float)amount;

Get an image from a file, but filled with a different fill color.
- (UIImage *)imageWithColor:(UIColor *)color;

Scale an image.
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

###UIImageView Helpers
Set an image from a URL and cache the image locally.
-(void)setImageUrl:(NSString*)urlString;

Round an image
-(void)round;

##Animation

###UIView+Bounce
Make your UI Feel alive and highlight important views by adding a playful bounce 
-(void)bounceFrom:(float)from to:(float)to;
-(void)bounceTo:(float)scale;
-(void)bounce:(BOOL)repeat;
-(void)endBounce;

###UIView+MotionEffects
Add cool motion effects that give your app depth by moving as you move your device
-(void)addMotionEffectsWithOffset:(float)offset;
-(void)addVerticalMotionEffectsWithOffset:(float)offset;
-(void)resizeFullScreenViewAndAddMotionEffectsWithOffset:(float)offset;
-(void)resizeHorizontallyAndAddMotionEffectsWithOffset:(float)offset;


##View Appearance

###UIView+Rounding
-(void)round:(float)cornerRadius withBorderWidth:(float)width andColor:(UIColor*)color;
-(void)round;
-(void)circleWithColor:(UIColor*)color width:(float)width;
-(void)circle;

###UIButton+Helpers
- (void)makeGlossy;
-(void)makeClean;

##Application View Hierarchy
Find the top most view controller from anywhere. Searches recursively through navigation, Tab bar and modal view controllers in your app window
###UIViewController
+(UIViewController*)topViewController;







