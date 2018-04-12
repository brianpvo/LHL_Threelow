//
//  GameController.m
//  Threelow
//
//  Created by Brian Vo on 2018-04-11.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"

@implementation GameController

- (instancetype)initWithDices:(NSMutableArray *) dices
{
    self = [super init];
    if (self) {
        _dices = dices;
        _heldDices = [[NSMutableSet alloc] init];
    }
    return self;
}

-(void) holdDie:(NSString *) dice {
    [_heldDices addObject:dice];
}

-(void) resetDice {
    [_heldDices removeAllObjects];
}

-(void) score {
    int score = 0;
    for (NSString *diceVal in _heldDices) {
        NSString *value = [diceVal substringWithRange:NSMakeRange(15, 1)];
        int val = [value intValue];
        score += val;
    }
    NSLog(@"Score: %i", score);
}

@end
