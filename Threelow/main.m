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
        InputHandler *inputHandler = [[InputHandler alloc] init];
        
        Dice *dice = [[Dice alloc] init];
        Dice *dice2 = [[Dice alloc] init];
        Dice *dice3 = [[Dice alloc] init];
        Dice *dice4 = [[Dice alloc] init];
        Dice *dice5 = [[Dice alloc] init];
        GameController *gameController = [[GameController alloc] initWithDices:@[dice, dice2, dice3, dice4, dice5]];
        
        //[dices addObjectsFromArray:@[dice, dice2, dice3, dice4, dice5]];
        while (1) {
            NSString *parsedInput = [inputHandler parse];
            
            if ([parsedInput isEqualToString:@"roll"]) {
                NSLog(@"Dice 1 rolls: %@", [[[gameController dices] objectAtIndex:0] randomizeVal]);
                NSLog(@"Dice 2 rolls: %@", [[[gameController dices] objectAtIndex:1] randomizeVal]);
                NSLog(@"Dice 3 rolls: %@", [[[gameController dices] objectAtIndex:2] randomizeVal]);
                NSLog(@"Dice 4 rolls: %@", [[[gameController dices] objectAtIndex:3] randomizeVal]);
                NSLog(@"Dice 5 rolls: %@", [[[gameController dices] objectAtIndex:4] randomizeVal]);
            }
            NSLog(@"Which dice do you want to hold? Enter 0 if none.");
            NSString *numDice = [inputHandler parse];
            int indexDice = [numDice intValue] - 1;
            if (![numDice isEqualToString:@"0"]) {
                //NSLog(@"%@", [[dices objectAtIndex:indexDice] holdDie]);
                NSString *diceBeingHeld = [[[gameController dices] objectAtIndex:indexDice] holdDie];
                //NSLog(@"%@", [NSString stringWithFormat:@"Dice %@ rolls: %@", numDice, diceBeingHeld]);
                [[gameController heldDices] addObject: [NSString stringWithFormat:@"Dice %@ rolls: %@", numDice, diceBeingHeld]];
                
            }
        }
    }
    return 0;
}
