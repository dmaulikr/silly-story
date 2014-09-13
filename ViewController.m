//
//  ViewController.m
//  Silly Story
//
//  Created by osaretin on 7/22/14.
//  Copyright (c) 2014 ozone. All rights reserved.
//

#import "ViewController.h"
#import "StoryGenerator.h"
#include <stdlib.h>

@interface ViewController ()



@end

@implementation ViewController

@synthesize word1= _word1;
@synthesize word2 = _word2;
@synthesize word3 = _word3;
@synthesize next = _next;
@synthesize str = _str;
@synthesize storyUITextView = _storyUITextView;
@synthesize storyGenerator = _storyGenerator;
@synthesize choice = _choice;
@synthesize choiceArray = _choiceArray;
@synthesize pageNumber = _pageNumber;
@synthesize pageNumberTotal = _pageNumberTotal;
@synthesize timer = _timer;
@synthesize timerTime = _timerTime;
@synthesize timeDisplay = _timeDisplay;
@synthesize wordPicker = _wordPicker;
@synthesize selectPicker = _selectPicker;
@synthesize isTextFieldSelected = _isTextFieldSelected;
@synthesize pickerViewContainer = _pickerViewContainer;
@synthesize changeWord = _changeWord;
//return keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn is called %@ placeholder text: %@",textField, textField.placeholder);
    self.selectPicker = textField.placeholder;
   [[self view] endEditing:YES];
    self.isTextFieldSelected = YES;
    [self viewDidLoad];
    self.changeWord = textField;
    return NO;
}

//pass data between segues
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"WordChooser"]){
        ViewController *wordChoice =(ViewController *)segue.destinationViewController;
        wordChoice.choice = self.choice;
        
    }
    else if([segue.identifier isEqualToString:@"StoryCreator"]){
        ViewController *showStory =(ViewController *)segue.destinationViewController;
        showStory.str = self.str;
    }
    
}

//timer
- (void)updateTimer{
    
    self.timerTime = 25.0;
    self.timer =[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateCountDown) userInfo:nil repeats:YES];
}

- (void) updateCountDown{
    self.timerTime  -= 1;
    if(self.timerTime == 0){
         self.timeDisplay.text = @"Time's Up!";
        [self.timer invalidate];
        [self go:self.next];
        
    }
    self.timeDisplay.text = [NSString stringWithFormat:@"%i",self.timerTime];
}
//load view
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    if([self.title  isEqual: @"categoryChooserView"]){
       // self.choice = 1;
        self.isTextFieldSelected = NO;
        self.choice = arc4random() % 2; //Pick 0 or 1
    }
       NSLog(@"self.choice ViewDidLoad %i",self.choice);
    
    self.storyGenerator  = [[StoryGenerator alloc] init];
    
    
    if([self.title  isEqual: @"wordChooserView"] && !self.isTextFieldSelected){
    
        if(self.choiceArray == nil){//only called when started
        
         switch(self.choice){
            case 0:
                NSLog(@"case 0 %i",[self.storyGenerator.storyArray1 count]);
                self.choiceArray = [[NSMutableArray alloc]initWithArray:self.storyGenerator.storyArray1];
            break;
            case 1:
                self.choiceArray = [[NSMutableArray alloc]initWithArray:self.storyGenerator.storyArray2];
            break;
        
        }//end switch
            //find total number of pages
            if([self.choiceArray count]%4 != 0 ){
                self.pageNumberTotal = [self.choiceArray count]/4 +1;
                //boolean leftover = YES; ?
            }
            else {
                self.pageNumberTotal = [self.choiceArray count]/4;
            }
            self.pageNumber = 0;
        }//end if self.choiceArray == nil
      
    if(!self.isTextFieldSelected){
        int place = 0;
        int y = 0;

    for(int i = self.pageNumber ; i < self.pageNumber + 4; i++ ) {
    
            NSLog(@"i: %i",i);
        
            UITextField *textField;
            
        if(place % 2 == 0){
                    textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 120+y, 100, 40)];
            
                }
        else {
                    textField = [[UITextField alloc] initWithFrame:CGRectMake(160, 120+y, 100, 40)];
            y += 50;
        }
            place++;
            //properties
            textField.borderStyle = UITextBorderStyleRoundedRect; //border style: rounded
            //vertical text alignment: center
            textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
            textField.textColor=[UIColor blackColor]; //text color
            textField.font = [UIFont systemFontOfSize:16]; //font size
            textField.backgroundColor = [UIColor clearColor]; //background color
            textField.tag = 200+i;  //creates a unique tag for each textField, starting with 200 then 201, 202
            textField.minimumFontSize = 9;
            textField.adjustsFontSizeToFitWidth = YES;
            textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        
        //NSLog(@"placeholder: %@ and index: %i",[self.choiceArray objectAtIndex:i], i);
        
            if(i < [self.choiceArray count]){
                textField.placeholder = [self.choiceArray objectAtIndex:i]; //place holder
                NSLog(@"placeholder: %@ and index: %i",[self.choiceArray objectAtIndex:i], i);

            }
            else{
                break;
            }
            NSLog(@"Adding subview: %f %f",textField.frame.origin.x,textField.frame.origin.y);
            [self.view addSubview:textField];//places the newly created textField into the viewController
            [textField becomeFirstResponder];
            textField.delegate = self;
           // NSLog(@"Textfield delegate is %@",textField.delegate);
        }
        [self updateTimer];
    }
    }
    NSLog(@"selectPicker: %@", self.selectPicker);
    NSLog(@"Check Boolean: %i", self.isTextFieldSelected);
    if(self.isTextFieldSelected){
        for(int j = 0; j < 10; j++ ){
            [self pickerView:self.wordPicker titleForRow:j forComponent:0];
        }
    self.isTextFieldSelected = NO;
        //CGRect rect= CGRectMake(0, 250, 320, 284);
        //[rect addSuview:self.wordPicker];
       // [rect draw];
        
    }
    //for StoryCreator segue
    NSLog(@" STR IN VIEW DID LOAD%@",self.str);
    self.storyUITextView.text =  self.str;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//get word and put them into story
- (IBAction)go:(id)sender{
    
    UIButton *goButton;
    for(UITextField *subView in [self.view subviews]){
        if([subView isKindOfClass:[UITextField class]]){//because not all subViews are textFields
            if(subView.tag > 199){
            [self.choiceArray replaceObjectAtIndex:self.pageNumber withObject:(UITextField *)subView.text];
                self.pageNumber++;
                [subView removeFromSuperview];
            }
            //take uibutton to use for if statement
        }
            if([subView isKindOfClass:[UIButton class]]){
                if(subView.tag == 10){goButton = (UIButton *)subView;}
            }
    }
    //self.pageNumber++; //needed to make next set starts instead of end of last set
    
    if(self.pageNumber >= [self.choiceArray count]){//if you've gotten to last page
        //TODO: add switch case for which method to call
        switch(self.choice){
            case 0:
                self.str = [StoryGenerator storyFirstTest:self.choiceArray];
                break;
            case 1:
                self.str = [StoryGenerator storySecondTest:self.choiceArray];
                break;
        }
        //use goButton for segue
       // [self prepareForSegue:segue sender:goButton];
        NSLog(@" IN GO%@",self.str);
        [self performSegueWithIdentifier:@"StoryCreator" sender:goButton];
    }
    else{
        [self viewDidLoad];
        NSLog(@"pageNumber %i",self.pageNumber);
    }
}
//whether or not to preform segue
- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if(self.pageNumber < [self.choiceArray count]){
        return NO;
    }
    return YES;
}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 10;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
   
    if([self.selectPicker  isEqual: @"Noun"]){
        return [[StoryGenerator randomNouns] objectAtIndex:row];
    }
    else if([self.selectPicker  isEqual: @"Verb"]){
        return [[StoryGenerator randomVerbs] objectAtIndex:row];
    }
    else if([self.selectPicker  isEqual: @"Adjective"]){
        return [[StoryGenerator randomAdjectives] objectAtIndex:row];
    }
   else if([self.selectPicker  isEqual: @"Adverb"]){
        return [[StoryGenerator randomAdverbs] objectAtIndex:row];
    }
    else if([self.selectPicker  isEqual: @"Plural Noun"]){
        return [[StoryGenerator randomPluralNouns] objectAtIndex:row];
    }
    else{
        return [[StoryGenerator randomGeneralWords] objectAtIndex:row];;
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.changeWord.text = [self pickerView:self.wordPicker titleForRow:row forComponent:0];
    NSLog(@"selectPicker: %@",self.selectPicker);
    self.isTextFieldSelected = NO;
}
- (IBAction)reset:(UIStoryboardSegue*)segue{
    }
@end
