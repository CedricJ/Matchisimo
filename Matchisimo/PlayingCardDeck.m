//
//  PlayingCardDeck.m
//  CardGame ItunesU
//
//  Created by Cedric Jirsell on 2013-02-03.
//  Copyright (c) 2013 Cedric Jirsell. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck

- (id)init{
	self = [super init];

	if(self){
		for(NSString *suit in [PlayingCard validSuits]){
			for (NSUInteger rank = 1; rank<= [PlayingCard maxRank]; rank++){
				PlayingCard *card = [[PlayingCard alloc] init];
				card.rank = rank;
				card.suit = suit;
				[self addCard:card atTop:NO];
			}
		}
	}
	
	return self;
}

@end
