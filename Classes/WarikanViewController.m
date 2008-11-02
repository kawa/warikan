#import "WarikanViewController.h"

@implementation WarikanViewController

- (void)awakeFromNib {
	carry = 0;
	kanji = NO;
}

- (void)calc {
	if(kanji == YES){
		[hasuMongon setText:@"幹事が余分に出すお金"];
		[kanjiMongon setText:@"（幹事支払額）"];
		[kanjiPrice setText:@""];
	}
	else{
		[hasuMongon setText:@"次にまわせるお金"];
		[kanjiMongon setText:@""];
		[kanjiPrice setText:@""];
	}
	int p_total = [[totalPrice text] intValue];
	int p_people = [[numOfPeople text] intValue];
	if(p_total > 0 && p_people > 0){
		int p_wari = p_total / p_people;
		int p_kanji = 1;
		if(kanji == YES){
			p_kanji = 0;
		}
		if(carry == 1){
			if((p_total % (p_people * 100)) > 0){
				p_wari = ((p_wari / 100) + p_kanji) * 100;
			}
		}
		else if(carry == 2){
			if((p_total % (p_people * 500)) > 0){
				p_wari = ((p_wari / 500) + p_kanji) * 500;
			}
		}
		else if(carry == 3){
			if((p_total % (p_people * 1000)) > 0){
				p_wari = ((p_wari / 1000) + p_kanji) * 1000;
			}
		}
		int p_odd = (p_wari * p_people) - p_total;
		if(carry == 0 && ((kanji == YES && p_odd > 0) || (kanji == NO && p_odd < 0))){
			p_wari = p_wari + p_kanji;
			p_odd = (p_wari * p_people) - p_total;
		}
		if(kanji == YES){
			p_odd = 0 - p_odd;
			[kanjiPrice setText:[NSString stringWithFormat:@"%d円", p_wari + p_odd]];
		}
		[warikanPrice setText:[NSString stringWithFormat:@"%d", p_wari]];
		[oddPrice setText:[NSString stringWithFormat:@"%d", p_odd]];
	}
	else{
		[warikanPrice setText:[NSString stringWithFormat:@"%d", 0]];
		[oddPrice setText:[NSString stringWithFormat:@"%d", 0]];
		if(kanji == YES){
			[kanjiPrice setText:@"0円"];
		}
	}
}

- (IBAction)endEditValues:(id)sender {
	[self calc];
	[sender resignFirstResponder];
}

- (void)escapeOSK {
	[totalPrice endEditing:YES];
	[numOfPeople endEditing:YES];
}

- (IBAction)onPushEscape:(id)sender {
			[self escapeOSK];
}

- (IBAction)onSelectCarry:(id)sender {
	carry = [sender selectedSegmentIndex];
	[self calc];
}

- (IBAction)onSelectKanji:(id)sender {
	kanji = [sender isOn];
	[self calc];
}

@end
