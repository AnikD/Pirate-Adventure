//
//  PAFactory.h
//  Pirate Adventure
//
//  Created by Shafqat Dulal on 6/12/14.
//  Copyright (c) 2014 SD Tech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PACharacter.h"

@interface PAFactory : NSObject

-(NSArray *)tiles;
-(PACharacter *)characterMake;

@end
