//
//  main.m
//  Threelow
//
//  Created by Brian Vo on 2018-04-11.
//  Copyright © 2018 Brian Vo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputHandler.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BOOL gameOn = YES;
        InputHandler *inputHandler = [[InputHandler alloc] init];
        
        Dice *dice = [[Dice alloc] initWithDiceNum:1];
        Dice *dice2 = [[Dice alloc] initWithDiceNum:2];
        Dice *dice3 = [[Dice alloc] initWithDiceNum:3];
        Dice *dice4 = [[Dice alloc] initWithDiceNum:4];
        Dice *dice5 = [[Dice alloc] initWithDiceNum:5];
        GameController *gameController = [[GameController alloc] initWithDices:@[dice, dice2, dice3, dice4, dice5]];
        
        while (gameOn) {
            NSString *parsedInput = [inputHandler parse];
            
            if ([parsedInput isEqualToString:@"roll"]) {
                if ([[gameController heldDices] count] == 0) {
                    
                    // PRINT ALL DICE AT RANDOM
                    for (int i=0; i < 5; i++) {
                        NSLog(@"Dice %i rolls: %@", [[[gameController dices] objectAtIndex:i] diceNumber], [[[gameController dices] objectAtIndex:i] randomizeVal]);
                    }
                }
                else {
                    for (Dice *d in [gameController heldDices]) {
                        NSLog(@"%@", d);
                    }
                    for (Dice *d in [gameController dices]) {
                        if ([d holdState] == 0) {
                            NSLog(@"Dice %i rolls: %@", [d diceNumber], [d randomizeVal]);
                        }
                    }
                }
                NSLog(@"Which dice do you want to hold? Enter 0 if none.");
                NSString *numDice = [inputHandler parse];
                int indexDice = [numDice intValue] - 1;
                if (![numDice isEqualToString:@"0"]) {
                    int diceVal = [[[gameController dices] objectAtIndex:indexDice] diceValue];
                    
                    // HOLD DICE
                    [[[gameController dices] objectAtIndex:indexDice] setHoldState:1];
                    [gameController holdDie:[NSString stringWithFormat:@"Dice %i rolls: [%i]", [[[gameController dices] objectAtIndex:indexDice] diceNumber], diceVal]];
                    //                NSLog(@"held dices: %@", [gameController heldDices]);
                    
                    // UN-HOLD DICE
                    NSLog(@"Are you sure you want to hold this dice? (y/n)\n");
                    NSString *answer = [inputHandler parse];
                    if ([answer isEqualToString:@"n"]) {
                        [[[gameController dices] objectAtIndex:indexDice] setHoldState:0];
                        [[gameController heldDices] removeObject:[NSString stringWithFormat:@"Dice %@ rolls: [%i]", numDice, diceVal]];
                    }
                    NSLog(@"held dices: %@", [gameController heldDices]);
                }
            }
            if ([parsedInput isEqualToString:@"reset"]) {
                [gameController resetDice];
            }
            if ([parsedInput isEqualToString:@"quit"]) {
                gameOn = NO;
                break;
            }
        }
    }
    return 0;
}
