//
//  Card.m
//  CardGame ItunesU
//
//  Created by Cedric Jirsell on 2013-02-03.
//  Copyright (c) 2013 Cedric Jirsell. All rights reserved.
//

#import "Card.h"

@interface Card()

@end

@implementation Card
@synthesize contents = _contents;

-(NSString *) nameForCard{
	return nil;
}

-(int)match:(NSArray *)otherCards{
	int score=0;
	
	for (Card *card in otherCards){
		if ([card.contents isEqualToString:self.contents]){
			score = 1;
		}
	}
	return score;
}


@end
