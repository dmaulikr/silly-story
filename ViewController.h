//
//  ViewController.h
//  Silly Story
//
//  Created by osaretin on 7/22/14.
//  Copyright (c) 2014 ozone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoryGenerator.h"

@interface ViewController : UIViewController <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

/*<UITextFieldDelegate>{
    IBOutlet UITextField* word1;
    IBOutlet UITextField* word2;
    IBOutlet UITextField* word3;
}*/

@property(weak, nonatomic) IBOutlet UITextField* word1;
@property(weak, nonatomic) IBOutlet UITextField* word2;
@property(weak, nonatomic) IBOutlet UITextField* word3;

@property (weak, nonatomic) IBOutlet UIButton *next;
@property(strong, nonatomic)  NSString *str;
@property(assign, nonatomic)  int choice;
@property(weak, nonatomic) IBOutlet UITextView* storyUITextView;
@property(strong, nonatomic)  StoryGenerator *storyGenerator;
@property(strong, nonatomic) NSMutableArray* choiceArray;
@property (assign, nonatomic) int pageNumber;
@property (assign, nonatomic) int pageNumberTotal;
@property (strong, nonatomic) NSTimer* timer;
@property (assign, nonatomic) int timerTime;
@property (weak, nonatomic) IBOutlet UILabel *timeDisplay;
@property (weak, nonatomic) IBOutlet UIPickerView *wordPicker;
@property (assign, nonatomic) BOOL isTextFieldSelected;
@property (strong,nonatomic) NSString* selectPicker;
@property (weak, nonatomic) IBOutlet UIView *pickerViewContainer;
@property (strong, nonatomic) UITextField* changeWord;
//@property (strong, nonatomic)
- (IBAction)go:(id)sender;
@end
