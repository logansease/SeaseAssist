//
//  UIView+Badge.h
//  MLTBadgedView
//
//

#import <UIKit/UIKit.h>

typedef enum {
    kBadgePlacementUpperLeft,
    kBadgePlacementUpperRight,
    kBadgePlacementUpperBest,
    kBadgePlacementLowerLeft,
} MLTBadgePlacement;


@interface MLTBadgeView : UIView {
    
}
// Determines where badge is placed
@property MLTBadgePlacement placement;
// The numeric value to display on the badge
@property(nonatomic,strong) NSString* badgeValue;
// The font for the badge number
@property(nonatomic, retain) UIFont *font;
// The interior color of the badge
@property(nonatomic) UIColor *badgeColor;
// The color for badge text
@property(nonatomic, retain) UIColor *textColor;
// The outline color for the badge
@property(nonatomic, retain) UIColor *outlineColor;
// The width of the outline around the badge
@property float outlineWidth;
// Force the badge to a minimum size
@property(nonatomic) float minimumDiameter;
// Show the badge no matter what
@property BOOL displayWhenZero;

@end

// Addition to UIView which allows any UIView to display
// a badge in the upper left or upper right corner of
// the view.
@interface UIView(Badged)
@property(nonatomic, readonly) MLTBadgeView *badge;
@end