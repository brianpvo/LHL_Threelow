//
//  GameController.h
//  Threelow
//
//  Created by Brian Vo on 2018-04-11.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property NSMutableArray *dices;
@property NSMutableSet *heldDices;

-(instancetype)initWithDices:(NSMutableArray *) dices;
-(void) holdDie:(NSString *) dice;
-(void) resetDice;
-(void) score;

@end
