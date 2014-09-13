//
//  StoryGenerator.h
//  Silly Story
//
//  Created by osaretin on 7/23/14.
//  Copyright (c) 2014 ozone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryGenerator : NSObject
@property (weak, nonatomic) NSString *story;
@property (strong, nonatomic)NSMutableArray *storyArray1;
//+ (NSMutableArray *) storyArray1;
@property (strong, nonatomic)NSMutableArray *storyArray2;
+ (NSString *)storyFirstTest:(NSMutableArray *)arr;
+ (NSString *)storySecondTest:(NSMutableArray *)arr;
+ (NSArray *)randomNouns;
+ (NSArray *)randomVerbs;
+ (NSArray *)randomAdjectives;
+ (NSArray *)randomAdverbs;
+ (NSArray *)randomPluralNouns;
+ (NSArray *)randomGeneralWords;
@end
