//
//  CardMatchingGame.h
//  Matchisimo
//
//  Created by Cedric Jirsell on 2013-02-04.
//  Copyright (c) 2013 Cedric Jirsell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject

//Designated Initializer
- (id)initWithCardCount:(NSUInteger)count
			  usingDeck:(Deck *)deck;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;


@property (readonly, nonatomic) int score;

@end
