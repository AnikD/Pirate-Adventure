//
//  PAFactory.m
//  Pirate Adventure
//
//  Created by Shafqat Dulal on 6/12/14.
//  Copyright (c) 2014 SD Tech. All rights reserved.
//
//  This essentially creates all the tiles. Factory is not as complicated as it sounds.

#import "PAFactory.h"
#import "PATile.h"

@implementation PAFactory

-(NSArray *)tiles
{
    /*Generate the 12 tiles, use an embedded array. at the end, "return tileArray" or something like that*/
    PATile *tile1 = [[PATile alloc] init];
    tile1.story = @"Captain, we need a leader such as yourself for the journey. We're on a grand quest for treasure—but there's an evil pirate Boss on the loose! Are you up for it?";
    tile1.backgroundImage = [UIImage imageNamed:@"PirateStart.jpg"];
    tile1.actionButtonName = @"Take blunt sword";
    PAWeapon *sword = [[PAWeapon alloc] init];
    sword.name = @"Sword";
    sword.damage = 15;
    tile1.weapon = sword;
    
    PATile *tile2 = [[PATile alloc] init];
    tile2.story = @"No need to worry; we're safe here. Also, there's sharper swords here! Maybe you would like to take one?";
    tile2.backgroundImage = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
    tile2.actionButtonName = @"Take sharp sword";
    PAWeapon *sharpSword = [[PAWeapon alloc] init];
    sharpSword.name = @"Sharp Sword";
    sharpSword.damage = 20;
    tile2.weapon = sharpSword;
    
    PATile *tile3 = [[PATile alloc] init];
    tile3.story = @"Enemy ship! Enemy ship! We need to fend off those other pirates!";
    tile3.backgroundImage = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
    tile3.actionButtonName = @"Battle!";
    tile3.healthEffect = -10;
    
    NSArray *column1 = [[NSArray alloc] initWithObjects:tile1, tile2, tile3, nil];
    
    PATile *tile4 = [[PATile alloc] init];
    tile4.story = @"Hey, you've found a stash of pirate weapons! Would you like to take a pistol?";
    tile4.backgroundImage = [UIImage imageNamed:@"PirateWeapons.jpeg"];
    tile4.actionButtonName = @"Take pistol";
    PAWeapon *pistol = [[PAWeapon alloc] init];
    pistol.name = @"Pistol";
    pistol.damage = 30;
    tile4.weapon = pistol;
                             
    PATile *tile5 = [[PATile alloc] init];
    tile5.story = @"You've reached the armory. There's steel armor here! Will you upgrade your armor to steel armor? We suggest you do so!";
    tile5.backgroundImage = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
    tile5.actionButtonName = @"Take armor";
    PAArmor *steelArmor = [[PAArmor alloc] init];
    steelArmor.name = @"Steel Armor";
    steelArmor.health = 15;
    tile5.armor = steelArmor;
                             
    PATile *tile6 = [[PATile alloc] init];
    tile6.story = @"What in the world? An octopus is attacking us!";
    tile6.backgroundImage = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
    tile6.actionButtonName = @"Battle Octopus";
    tile6.healthEffect = -15;
                             
    NSArray *column2 = [[NSArray alloc] initWithObjects:tile4, tile5, tile6, nil];
    
    PATile *tile7 = [[PATile alloc] init];
    tile7.story = @"Captain, enemy pirates have gotten onto our ship and we need to get them off!";
    tile7.backgroundImage = [UIImage imageNamed:@"PirateAttack.jpg"];
    tile7.actionButtonName = @"Attack!";
    tile7.healthEffect = -10;
                             
    PATile *tile8 = [[PATile alloc] init];
    tile8.story = @"Oh no. You've been captured by pirates. Now, you're ordered to walk the plank.";
    tile8.backgroundImage = [UIImage imageNamed:@"PiratePlank.jpg"];
    tile8.actionButtonName = @"I'm fearless!";
    tile8.healthEffect = -15;
                             
    PATile *tile9 = [[PATile alloc] init];
    tile9.story = @"Captain, we found some treasure. Not exactly the treasure that we were searching for, but it sure boosts our morale.";
    tile9.backgroundImage = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
    tile9.actionButtonName = @"Feeling very happy!";
    tile9.healthEffect = 5;
                             
    NSArray *column3 = [[NSArray alloc] initWithObjects:tile7, tile8, tile9, nil];
    
    PATile *tile10 = [[PATile alloc] init];
    tile10.story = @"Hey, we've found a parrot! Unfortunately it's bothering all of us and we really need to get rid of it. Our ears hurt.";
    tile10.backgroundImage = [UIImage imageNamed:@"PirateParrot.jpg"];
    tile10.actionButtonName = @"Leave Parrot";
    tile10.healthEffect = -5;
                             
    PATile *tile11 = [[PATile alloc] init];
    tile11.story = @"We've hit the jackpot! There's so many gold coins and jewels. Let's go buy some food and other things to help heal ourselves.";
    tile11.backgroundImage = [UIImage imageNamed:@"PirateTreasure.jpeg"];
    tile11.actionButtonName = @"Heal";
    tile11.healthEffect = 10;
                             
    PATile *tile12 = [[PATile alloc] init];
    tile12.story = @"The pirate boss is here! This is the final showdown!";
    tile12.backgroundImage = [UIImage imageNamed:@"PirateBoss.jpeg"];
    tile12.actionButtonName = @"Fight!";
    PABoss *boss = [[PABoss alloc] init];
    boss.health = 120;
    tile12.boss = boss;
                             
    NSArray *column4 = [[NSArray alloc] initWithObjects:tile10, tile11, tile12, nil];
    
    NSArray *tiles = [[NSArray alloc] initWithObjects:column1, column2, column3, column4, nil];
    
    return tiles;
    
}

-(PACharacter *)characterMake
{
    PACharacter *player = [[PACharacter alloc] init];
    player.health = 100;
    
    PAWeapon *fists = [[PAWeapon alloc] init];
    fists.name = @"Fists";
    fists.damage = 10;
    
    PAArmor *cloak = [[PAArmor alloc] init];
    cloak.name = @"Cloak";
    cloak.health = 5;
    
    player.weapon = fists;
    player.armor = cloak;
    player.health = player.health + player.armor.health;
    player.damage = player.damage + player.weapon.damage;
    
    return player;
}

@end
