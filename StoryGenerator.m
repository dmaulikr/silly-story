//
//  StoryGenerator.m
//  Silly Story
//
//  Created by osaretin on 7/23/14.
//  Copyright (c) 2014 ozone. All rights reserved.
//

#import "StoryGenerator.h"

@implementation StoryGenerator
@synthesize story = _story;
@synthesize storyArray1 = _storyArray1;
@synthesize storyArray2 = _storyArray2;


- (id) init {
    if (self = [super init]){
        self.story = @"No Story. Sorry, try again.";
        self.storyArray1 =
            [NSMutableArray arrayWithObjects:@"Noun",@"Plural Noun",@"Verb", nil];
        self.storyArray2 =
            [NSMutableArray arrayWithObjects:@"Noun",@"Verb",@"Noun",
             @"Plural Noun", @"Verb",@"Noun",@"Adjective",@"Noun", nil];
    }
    return self;
}
+ (NSString *)storyFirstTest:(NSMutableArray*) arr
{
    return [NSString stringWithFormat:@"%@%@%@%@%@%@",
            @"This is a ",[arr objectAtIndex:0],//noun1
            @" to see how this program works. Better ",[arr objectAtIndex:1],//noun2
            @" will eventually be added. Thanks for ",[arr objectAtIndex:2]//verb
            ];
    /*
        self->story = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                        @"This is a ",[arr objectAtIndex:0],//noun1
                        @" to see how this program works. Better ",[arr objectAtIndex:1],//noun2
                        @" will eventually be added. Thanks for ",[arr objectAtIndex:2]//verb
                        ];
    
    return self->story;
    */
}

+ (NSString *)storySecondTest:(NSMutableArray*) arr{
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",
            @"This is the second ", [arr objectAtIndex:0],//noun1
            @" to ", [arr objectAtIndex:1],//verb1
            @" if the ", [arr objectAtIndex:2],//noun2
            @" works. These are more ", [arr objectAtIndex:3],//pluralNoun
            @" to ",[arr objectAtIndex:4],//verb2
            @" more choices in the ", [arr objectAtIndex:5],//noun3
            @". Stay ", [arr objectAtIndex:6],//adjective
            @" for ", [arr objectAtIndex:7] //noun4
            ];

    
    /*self.story = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@%@",
                  @"This is the second ", [arr objectAtIndex:0],//noun1
                  @" to ", [arr objectAtIndex:1],//verb1
                  @" if the ", [arr objectAtIndex:2],//noun2
                  @"works. These are more ", [arr objectAtIndex:3],//pluralNoun
                  @" to ",[arr objectAtIndex:4],//verb2
                  @" more choices in the ", [arr objectAtIndex:5],//noun3
                  @". Stay ", [arr objectAtIndex:6],//pastTenseVerb
                  @" for ", [arr objectAtIndex:7] //noun4
                  ];
    return self.story;*/
}
+ (NSArray *)randomNouns{
    return [NSMutableArray arrayWithObjects:@"boy",@"girl", @"cat",@"babe",@"human",@"desire",@"fantasy", @"secret",@"glasses",@"pencil", nil];
}
+ (NSArray *)randomVerbs{
    return [NSMutableArray arrayWithObjects:@"jump",@"go", @"run",@"eat",@"write",@"shuffle",@"play", @"grind", @"laugh",@"fly", nil];
}
+ (NSArray *)randomPluralNouns{
    return [NSMutableArray arrayWithObjects:@"puppies",@"champagne flutes", @"rags",@"suits",@"chests",@"treasures",@"friends", @"lovers",@"books",@"libraries", nil];
}
+ (NSArray *)randomAdverbs{
    return [NSMutableArray arrayWithObjects:@"cutely",@"there", @"readily",@"willingly",@"ridiculously",@"lightly","quickly", @"frequently",@"coldly",@"slyly", nil];
}
+ (NSArray *)randomAdjectives{
    return [NSMutableArray arrayWithObjects:@"blue",@"cool", @"hot",@"wooden",@"green",@"rich",@"flushed", @"enthusiastic",@"ready",@"poor", nil];
}
+ (NSArray *)randomGeneralWords{
    return [NSMutableArray arrayWithObjects:@"fluff",@"flick", @"pin",@"clip",@"rip",@"ship",@"tip", @"slip",@"crown",@"rap", nil];
}


@end
