//
//  ViewController.m
//  Matchisimo
//
//  Created by Cedric Jirsell on 2013-02-03.
//  Copyright (c) 2013 Cedric Jirsell. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;

@end

@implementation ViewController

- (CardMatchingGame *) game{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons        count] usingDeck:[[PlayingCardDeck alloc] init]];
    return _game;
}

- (void)setCardButtons:(NSArray *)cardButtons{
	_cardButtons = cardButtons;
	[self updateUI];
}

- (void) updateUI{
	for (UIButton *cardButton in self.cardButtons){
		Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
		[cardButton setTitle:card.contents forState:UIControlStateSelected];
		[cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
		cardButton.selected = card.isFaceUp;
		cardButton.enabled = !card.isUnplayable;
		cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
	}
	self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}


- (void) setFlipCount:(int)flipCount{
	_flipCount = flipCount;
	self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
	
	[self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
	self.flipCount++;
	[self updateUI];

}

@end

