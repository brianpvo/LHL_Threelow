//
//  Dice.h
//  Threelow
//
//  Created by Brian Vo on 2018-04-11.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property int value;
@property int diceNumber;
@property int holdState;

-(instancetype)initWithDiceNum:(int) num;
-(NSString *) randomizeVal;
-(int)diceValue;
-(int)diceHoldState;
@end
