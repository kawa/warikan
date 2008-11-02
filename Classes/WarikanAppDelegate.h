#import <UIKit/UIKit.h>

@class WarikanViewController;

@interface WarikanAppDelegate : NSObject <UIApplicationDelegate> {
	IBOutlet UIWindow *window;
	IBOutlet WarikanViewController *viewController;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) WarikanViewController *viewController;

@end

