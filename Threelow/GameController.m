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
        _dices = dices.mutableCopy;
        _heldDices = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
