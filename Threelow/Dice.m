//
//  Dice.m
//  Threelow
//
//  Created by Brian Vo on 2018-04-11.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(NSString *) randomizeVal {
        _value = arc4random_uniform(6) + 1;
    return [NSString stringWithFormat:@"%i", _value];
}

-(NSString *)holdDie {
    return [NSString stringWithFormat:@"[%i]", _value];
}

-(NSString *) resetDice {
    
    return @"";
}

@end
