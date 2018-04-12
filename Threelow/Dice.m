//
//  Dice.m
//  Threelow
//
//  Created by Brian Vo on 2018-04-11.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "Dice.h"

@implementation Dice

- (instancetype)initWithDiceNum:(int) num
{
    self = [super init];
    if (self) {
        _diceNumber = num;
        _holdState = 0;
    }
    return self;
}

-(NSString *) randomizeVal {
        _value = arc4random_uniform(6) + 1;
    return [NSString stringWithFormat:@"%i", _value];
}

-(int) diceValue {
    return _value;
}

-(int) diceHoldState {
    return _holdState;
}

@end
