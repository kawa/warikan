#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface WarikanViewController : UIViewController {
    IBOutlet id numOfPeople;
    IBOutlet id oddPrice;
    IBOutlet id totalPrice;
    IBOutlet id warikanPrice;
    IBOutlet id hasuMongon;
    IBOutlet id kanjiMongon;
    IBOutlet id kanjiPrice;
		int carry;
		BOOL kanji;
}
- (void)calc;
- (void)escapeOSK;
- (IBAction)endEditValues:(id)sender;
- (IBAction)onPushEscape:(id)sender;
- (IBAction)onSelectCarry:(id)sender;
- (IBAction)onSelectKanji:(id)sender;
@end
