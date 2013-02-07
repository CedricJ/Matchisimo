//
//  CardMatchingGame.m
//  Matchisimo
//
//  Created by Cedric Jirsell on 2013-02-04.
//  Copyright (c) 2013 Cedric Jirsell. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (readwrite, nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards; //of cards

@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
	if (!_cards) _cards = [[NSMutableArray alloc] init];
		return _cards;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
	return (index < [self.cards count]) ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1


- (void)flipCardAtIndex:(NSUInteger)index
{
	Card *card = [self cardAtIndex:index];
	NSLog(@"Test");
	if (!card.isUnplayable){
		if (!card.isFaceUp){
		for (Card *otherCard in self.cards){
			if(otherCard.isFaceUp && !otherCard.isUnplayable){
				int matchScore = [card match:@[otherCard]];
				if(matchScore){
					card.Unplayable = YES;
					otherCard.Unplayable = YES;
					self.score += matchScore * MATCH_BONUS;
				} else{
					self.score -= MISMATCH_PENALTY;
				}
				break;
			}
		}
			self.score -= FLIP_COST;
		}
		card.faceUp = !card.isFaceUp;
		
	}
}

- (id)initWithCardCount:(NSUInteger)count
			  usingDeck:(Deck *)deck
{
	self = [super init];
	
	if(self){
		for (int i=0; i<count; i++){
			Card *card = [deck drawRandomCard];
			if (card){
				NSLog(@"fdf");
				self.cards[i] = card;
			}
			else{
				self = nil;
				break;
			}
		}
	}
	
	return self;
}

@end
