//
//  Card.h
//  CardGame ItunesU
//
//  Created by Cedric Jirsell on 2013-02-03.
//  Copyright (c) 2013 Cedric Jirsell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter=isFaceUp) BOOL faceUp;
@property (nonatomic, getter=isUnplayable) BOOL unplayable;

- (int)match:(NSArray *)otherCards;
- (NSString *)nameForCard;

@end
