//
//  PlayingCard.h
//  CardGame ItunesU
//
//  Created by Cedric Jirsell on 2013-02-03.
//  Copyright (c) 2013 Cedric Jirsell. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSArray *)rankStrings;
+ (NSUInteger)maxRank;

@end
