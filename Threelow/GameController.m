//
//  GameController.m
//  Threelow
//
//  Created by Brian Vo on 2018-04-11.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "GameController.h"

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

@end
