//
//  PATile.h
//  Pirate Adventure
//
//  Created by Shafqat Dulal on 6/12/14.
//  Copyright (c) 2014 SD Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAWeapon.h"
#import "PAArmor.h"
#import "PABoss.h"

@interface PATile : NSObject

@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) UIImage *backgroundImage;
@property (strong, nonatomic) NSString *actionButtonName;
@property (strong, nonatomic) PAWeapon *weapon;
@property (strong, nonatomic) PAArmor *armor;
@property (strong, nonatomic) PABoss *boss;
@property (nonatomic) int healthEffect;

@end
