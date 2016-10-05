# SeaseAssist

[![CI Status](http://img.shields.io/travis/Logan Sease/SeaseAssist.svg?style=flat)](https://travis-ci.org/Logan Sease/SeaseAssist)
[![Version](https://img.shields.io/cocoapods/v/SeaseAssist.svg?style=flat)](http://cocoapods.org/pods/SeaseAssist)
[![License](https://img.shields.io/cocoapods/l/SeaseAssist.svg?style=flat)](http://cocoapods.org/pods/SeaseAssist)
[![Platform](https://img.shields.io/cocoapods/p/SeaseAssist.svg?style=flat)](http://cocoapods.org/pods/SeaseAssist)

##Summary Info

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
- UIAlertController Helpers to show with actions and text input
- Image Helpers for things like blurring and resizing
- Animation and Motion Effects Helpers
- A View Controller helper that can recursively determine the visible view controller from anywhere in your application
- A new helper that shows text on screen for a short time, like an Android "Toast"
- Network Reachability Helper
- An Event Counter to track the number of times an event has occurred during the life of an app, or daily.
- Blurred Background Helpers, to present a view over another and blur the background.
- Keyboard Helpers to add an action tool bar and hide the keyboard on click
- TextField subclasses for date and value inputs
- A service to help send emails easily from anywhere
- SO MUCH MORE!


Enjoy! Please feel free to fork and contribute to this repo!


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

This pod will work if your project uses objective-c or Swift.
- For best results with an objective-c Project, add the SeaseAssist.h import into your .pch file and you will not need to import SeaseAssist into each of your classes that references it.
- For Similiar result with Swift, you should NOT include the use_frameworks! in your pod file and add a bridging header that includes the library. If you must use_frameworks!, then you need to include SeaseAssist in any class that uses its functions.
-- add a new header file to yoour project named ProjectName-Bridging-Header.h
-- add '#import <SeaseAssist/SeaseAssist.h>' to your header file
-- in your Target Build settings -> Swift Compiler Code Generation -> Objective-C Bridging Header, add a reference to the newly created file. Should be [ProjectName/ProjectName-Bridging-Header.h]


## Author

Logan Sease, lsease@gmail.com

## License

SeaseAssist is available under the MIT license. See the LICENSE file for more info.


#### Sorry, there is a lot here. I will do my best to try to keep this documentation readable.

#UI CLASSES

##CleanButton
A modern button with a nice clean rounded border, an empty background and some text

##GlossyButton
A button with a gradient filled background matching the button's Tint Color

##RoundedView
A View with slightly rounded corners and a thin border.

##DatePickerTextField
Create a UITextField with a Date picker instead of a keyboard

##ValuePickerTextField
A UITextField with a PickerView instead of a keyboard

#MLTBadgeView
A badge that goes over any UIView. See UIView+Badge.h
```
[view.badge setBadgeValue:@"4"];
```


#SERVICES

##EventCounterService
A class to track events throughout the life of the app, or daily events

```objective-c
+(NSUInteger)addCountForEvent:(NSString*)event count:(NSInteger)add;
+(NSUInteger)addCountForEvent:(NSString*)event;
+(void)resetCountForEvent:(NSString*)event;
+(NSUInteger)checkCountForEvent:(NSString*)event;
+(NSUInteger)checkDailyEventCount:(NSString*)dailyEvent;
+(NSUInteger)addDailyEventCount:(NSString*)dailyEvent;
+(NSUInteger)addCountForDailyEvent:(NSString*)dailyEvent count:(NSInteger)count;
```

##Sound Service
A service to play sounds and maintain a queue

```objective-c
+ (id)sharedService;
+(void)playSoundAtPath:(NSString*)path;
+(void)playSoundAtPath:(NSString*)path withVolume:(float)volume;
+(void)addSoundToQueueAtPath:(NSString*)path;
-(void)pauseQueue;
-(void)resumeQueue;
-(BOOL)isPlaying;
```

##SpeechService
Simple Text to Speech with the Siri API
```objective-c
+ (id)sharedService;
+(BOOL)isSpeaking;
-(void)speakText:(NSString*)text;
```

##Email Service
A simple Email interface to open an email view controller from anywhere.
```
-(void)emailTo:(NSArray*)emails withSubject:(NSString*)subject body:(NSString*)body attachments:(NSArray<MailServiceAttachment*>*)attachments fromVC:(UIViewController*)parent  andCompletion:(void(^)(BOOL success))handler;
```

##Image Picker
A simple interface to show an image picker
```
@interface ImagePickerHelper 
-(void)selectImageFrom:(UIViewController*)source ofType:(UIImagePickerControllerSourceType)type andCompletion:(void(^)(UIImage* image))handler;
```

#NETWORKING

##HTTPRequest
A helper class to make http requests asynchronously in one line without the need for any 3rd party frameworks.

##For a more robust Networking helper, see QwikHttp, and also QwikJson for json parsing.
```objective-c
+(void)jsonRequestToUrl:(NSString*)urlString withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler;

+(void)httpRequestToUrl:(NSString*)urlString  withMethod:(NSString*)method withHeaders:(NSDictionary*)headers withParams:(NSDictionary*)params withHandler:(void (^)(NSString* response,NSError * error))handler;

+(NSString*)addParameters:(NSDictionary*)urlParams toUrl:(NSString*)url;
```

##Reachability Helpers
Find our internet connection status.
```objective-c
@interface ReachabilityTest : NSObject
+(BOOL)connected;
@end
```
#CLASS EXTENSIONS

##Json Serialization and Deserialization

###NSDictionary
```objective-c
-(NSString*)toJsonString;
+(NSDictionary*)fromJsonString:(NSString*)json;
```

###NSArray
```objective-c
-(NSString*)toJsonString;
+(NSArray*)fromJsonString:(NSString*)json;
```
##NSDate Helpers
```objective-c
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
```

##NSMutableArray Helpers
```objective-c
- (void)shuffle;

//wrap an array around a single object (make it the first object and then go to the end
//and start back at the beginning.
-(NSArray*)rotatedArrayAround:(NSInteger)index;
```

##NSString Helpers
```objective-c
-(NSInteger)occurancesOfString:(NSString*)test;
-(BOOL)contains:(NSString *)string;
+(NSString*)empty;
- (NSInteger)indexOf: (char)character;
-(NSArray *)splitOnChar:(char)ch;
-(NSString *)substringFrom:(NSInteger)from to:(NSInteger)to;
-(NSString *)stringByStrippingWhitespace;
-(NSString*)initials; //Herby Hancock = HH
+(NSString*)displayString:(float)number; //1,200 = 1.2K
```

##NSString validation
```objective-c
-(BOOL)isValidEmail:(BOOL)laxValidation;
-(BOOL)isValidEmail;
-(BOOL)isDigitOfLength:(NSInteger)length;
-(BOOL)isBlank;
+(BOOL)isValidAlphanumbericChars:(NSString*)textString;
```

##Encryption Helpers
###NSData
```objective-c
-(NSData *) aesEncryptedDataWithKey:(NSData *) key;
-(NSString*)toBase64;
```

###NSString
```objective-c
- (NSData *) sha256;
- (NSString *) stringFromMD5;

//secure a string by adding Key Encryption and then Base 64 Encoding it.
- (NSString*)encryptWithKey:(NSString*)key;
```

##NSThread Helpers
Run blocks in the main or background threads with ease
```objective-c
+(void)mainThread:(void (^)())main;
+(void)backgroundThread:(void (^)())background;
+(void)delay:(float)length code:(void (^)())function;
```

##UIDevice: Unique Identifiers
Since apple now longer gives access to device level Identifier information, this is another way to get an Identifier based on a hash of the mac address
```objective-c
- (NSString *) uniqueDeviceIdentifier;
- (NSString *) uniqueGlobalDeviceIdentifier;
```

##UIDevice system version
```objective-c
+(BOOL)versionGreaterThanOrEqual:(NSString*)version;
```

##Keychain Helpers
Read and write to the keychain.
```objective-c
@interface UIDevice (Keychain)
+(void)write:(NSString*)value toKeychainWithKey:(NSString*)key appSpecific:(BOOL)appSpecific;
+(NSString*)readFromKeychainWithKey:(NSString*)key appSpecific:(BOOL)appSpecific;
@end
```

##Alerts

###SAMBProgressHUD+Singleton
An extension to SAMBProgressHUD to show a loading dialog singleton without needing to add it to your view or set it up.
```objective-c
+(void)showWithTitle:(NSString*)title;
+(void)hide;
```

###UIAlertController
Show an alert controller with actions and get notified what action was chosen with a single line
```objective-c
+(void)showAlertWithTitle:(NSString*)title andMessage:(NSString*)message from:(UIViewController*)controller;
+(void)showDialogWithTitle:(NSString*)title andMessage:(NSString*)message from:(UIViewController*)controller andActions:(NSArray<NSString*>*)buttonTitles completionHandler:(void (^)(NSInteger selected))handler;
+(void)showTextEntryDialogWithTitle:(NSString*)title andMessage:(NSString*)message andPlaceHolder:(NSString*)holder from:(UIViewController*)controller completionHandler:(void (^)(NSString* text))handler;
```

###UIAlertView
```objective-c
+(void)showWithTitle:(NSString*)title andMessage:(NSString*)message;
```

###UILabel+Message
Show a quick "Toast" on screen for a desired amount of time
```objective-c
+(void)showMessage:(NSString*)message ofSize:(float)fontSize ofColor:(UIColor*)color inView:(UIView*)view forDuration:(float)seconds;
```

##Images

###UIImage Helpers
```objective-c
//Add a gassian Blur of the desired amount of pixels
-(UIImage*)blurredImage:(float)amount;


//Get an image from a file, but filled with a different fill color.
- (UIImage *)imageWithColor:(UIColor *)color;

//Scale an image.
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;

//turn an image to greyscale
-(UIImage*) toGrayscale;

//capture an uiimage from a uiview
+(UIImage*)fromView:(UIView*)view;

```

Cache image and load from cache
```
+(void)cacheImage:(UIImage*)image forUrl:(NSString*)url;
+(NSString*)cacheFileNameFor:(NSString*)url;
+(UIImage*)cachedImageForUrl:(NSString*)url;
+(void)loadImageToCacheFrom:(NSString*)url;
```




###UIImageView Helpers
Set an image from a URL and cache the image locally.
```objective-c
-(void)setImageUrl:(NSString*)urlString;
```
Round an image
```objective-c
-(void)round;
-(UIImage*)clippedToCircle;
```

Set an image from URL to a UIImage View with caching and a default
```objective-c
@interface UIImageView (Networking)
-(void)setImageFromUrl:(NSString*)url withDefault:(UIImage*)defaultImage andRounding:(BOOL)round;
```

Set an image from URL like above, but prefill with initials if no image is found
```
@interface UIImageView (Initials)
-(UILabel*)addInitialsPlaceholder:(NSString*)title circle:(BOOL)circle;
-(void)setImageFromUrl:(NSString*)urlString withPlaceholderString:(NSString*)holder withPlaceHolderImage:(UIImage*)image rounding:(BOOL)round;
-(void)setImageFromUrl:(NSString*)urlString withPlaceholderString:(NSString*)holder withPlaceHolderImage:(UIImage*)image rounding:(BOOL)round completionHandler:(BoolCompletionHandler)handler;
```

##Animation

###UIView+Bounce
Make your UI Feel alive and highlight important views by adding a playful bounce 
```objective-c
-(void)bounceFrom:(float)from to:(float)to;
-(void)bounceTo:(float)scale;
-(void)bounce:(BOOL)repeat;
-(void)endBounce;
```

###UIView+MotionEffects
Add cool motion effects that give your app depth by moving as you move your device
```objective-c
-(void)addMotionEffectsWithOffset:(float)offset;
-(void)addVerticalMotionEffectsWithOffset:(float)offset;
-(void)resizeFullScreenViewAndAddMotionEffectsWithOffset:(float)offset;
-(void)resizeHorizontallyAndAddMotionEffectsWithOffset:(float)offset;
+(void)addMotionEffectsTo:(NSArray*)views withOffset:(float)offset;
```

###UIView+AnimateShow
animating hiding and showing of a view or a group of views
```
-(void)animateShow;
-(void)animateHide;
+(void)animateShow:(NSArray<UIView*>*)views;
+(void)animateHide:(NSArray<UIView*>*)views;
+(void)animateShow:(NSArray<UIView*>*)views withDelay:(float)delay;
```


##View Appearance

###UIView
```objective-c
//round the corners 
-(void)round:(float)cornerRadius withBorderWidth:(float)width andColor:(UIColor*)color;
-(void)round;

//completely circle the view and optionally add a border.
-(void)circleWithColor:(UIColor*)color width:(float)width;
-(void)circle;

//add a visual effect view with a blur
-(UIVisualEffectView*)blur;

//adjust a frame
-(void)adjustFrameXOffset:(float)horizontal yOffset:(float)vertical hOffset:(float)height wOffset:(float)width;
```

###UIButton+Helpers
```objective-c
- (void)makeGlossy;
- (void)makeClean;
-(void)setTitle:(NSString*)title;
```

###UIColor+hex.h
```objective-c
+(UIColor*)colorWithHex:(NSString*)hex;
```

###Segmented Control
```objective-c
@interface UISegmentedControl (Helpers)
-(BOOL)setSelectedSegmentNamed:(NSString*)name;
-(NSArray*)allTitles;
-(NSString*)selectedSegementTitle;
@end
```

###

##Application View Hierarchy
Find the top most view controller from anywhere. Searches recursively through navigation, Tab bar and modal view controllers in your app window
###UIViewController+Top
```objective-c
+(UIViewController*)topViewController;
```
```
@interface UIView (Search)
-(NSArray*)searchForSubviewsOfType:(Class)searchClass;
@end
```

##Backgrounds
### BLURRED: For use with a Covers Current Context Modal Transition
```objective-c
@interface UIViewController (Blur)
-(UIVisualEffectView*)blurBackground;
-(UIVisualEffectView*)blurBackgroundOfTableView:(UITableView*)tableView;
-(UIVisualEffectView*)darkBlurBackground;
-(UIVisualEffectView*)darkBlurBackgroundOfTableView:(UITableView*)tableView;
@end

@interface UITableViewController (Blur)
-(UIVisualEffectView*)blurBackground;
-(UIVisualEffectView*)darkBlurBackground;
@end
```
###To Present and Blur Without a storyboard
```objective-c
@interface UIViewController (Presentation)
+(void)present:(nonnull UIViewController* )newVC on:(nullable UIViewController*)source;
+(void)present:(nonnull UIViewController* )newVC on:(nullable UIViewController*)source withBlur:(float)blurAmount;
```

###Add Non-Blurred background images

```
@interface UIViewController (Background)
-(void)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha;
@end


@interface UITableViewController (Background)
-(void)setBackgroundImage:(UIImage*)image withAlpha:(float)alpha;
@end
```

##UITableView Helpers
Reload sections of a tableview
```objective-c
-(void)reloadSection:(NSInteger)section;
-(void)reloadSections:(NSInteger)fromSection to:(NSInteger)toSection;
```
Add a header to a tableview
```objective-c
-(void)setupTableHeader:(UIImage*)image;
```

##Navigation Helpers

###Add Tranitions
```objective-c
@interface UINavigationController (Transition)
//add a fade transitions between view controllers for your next push
-(void)addFadeTransition;

```

//go back, either by popping or dismissing--- but let this figure out which.
```
UIViewController+Back
-(void)goBackWithAnimation:(BOOL)animates;
```



##Keyboard Helpers 
```objective-c
UIView
-(void)hideKeyboardOnClick;
-(UIView*)findFirstResponder;
```

```objective-c
UITextField
-(UIToolbar*)addToolbarWithLeftButton:(NSString*)lTitle withSelector:(SEL)lSelector andRightButton:(NSString*)rTitle withSelector:(SEL)rSelector andTarget:(id)target;
```

##Path Helpers on NSFileManager
```objective-c
+(NSString *)myDocumentsPathForFile:(NSString*)fileName;
+(NSString *)tempPathForFile:(NSString*)fileName;
```






