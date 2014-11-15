//
//  PACharacter.h
//  Pirate Adventure
//
//  Created by Shafqat Dulal on 6/12/14.
//  Copyright (c) 2014 SD Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAWeapon.h"
#import "PAArmor.h"

@interface PACharacter : NSObject

@property (strong, nonatomic) PAWeapon *weapon;
@property (strong, nonatomic) PAArmor *armor;
@property (nonatomic) int health;
@property (nonatomic) int damage;

@end
