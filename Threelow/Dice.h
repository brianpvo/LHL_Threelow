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

-(NSString *) randomizeVal;

-(NSString *) holdDie;

-(NSString *) resetDice;

@end
