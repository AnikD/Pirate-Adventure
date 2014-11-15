//
//  PAViewController.m
//  Pirate Adventure
//
//  Created by Shafqat Dulal on 6/12/14.
//  Copyright (c) 2014 SD Tech. All rights reserved.
//

#import "PAViewController.h"
#import "PAFactory.h"
#import "PATile.h"

@interface PAViewController ()

@end

@implementation PAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    PAFactory *factory = [[PAFactory alloc] init];
    
    self.tiles = [factory tiles];
    self.currentPoint = CGPointMake(0, 0);
    NSLog(@"%.1f, %.1f", self.currentPoint.x, self.currentPoint.y);
    self.player = [factory characterMake];
    [self setTile];
    [self surroundingTilesExist];
    NSLog(@"%i", self.player.health);
    NSLog(@"%i", self.player.damage);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Helper methods.
- (void)setTile
{
    PATile *tileModel = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    self.storyLabel.text = tileModel.story;
    self.backgroundImage.image = tileModel.backgroundImage;
    [self.actionButtonLabel setTitle:tileModel.actionButtonName forState:UIControlStateNormal];
    self.characterHealth.text = [NSString stringWithFormat:@"%i", self.player.health];
    self.characterWeapon.text = self.player.weapon.name;
    self.characterDamage.text = [NSString stringWithFormat:@"%i", self.player.weapon.damage];
    self.characterArmor.text = self.player.armor.name;
}

- (void)surroundingTilesExist
{
    CGPoint northPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    if (northPoint.y > 2) {
        self.northButton.hidden = YES;
    } else {
        self.northButton.hidden = NO;
    }
    
    CGPoint southPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    if (southPoint.y < 0) {
        self.southButton.hidden = YES;
    } else {
        self.southButton.hidden = NO;
    }
    
    CGPoint eastPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    if (eastPoint.x < 0) {
        self.eastButton.hidden = YES;
    } else {
        self.eastButton.hidden = NO;
    }
    
    CGPoint westPoint = CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    if (westPoint.x > 3) {
        self.westButton.hidden = YES;
    } else {
        self.westButton.hidden = NO;
    }
}

//Methods connected with storyboard.
- (IBAction)actionButton:(id)sender {
    PATile *tileOfAction = [[self.tiles objectAtIndex:self.currentPoint.x] objectAtIndex:self.currentPoint.y];
    if (tileOfAction.weapon) {
        self.player.damage = self.player.damage - self.player.weapon.damage + tileOfAction.weapon.damage;
        self.player.weapon = tileOfAction.weapon;
    }
    else if (tileOfAction.armor) {
        self.player.health = self.player.health - self.player.armor.health + tileOfAction.armor.health;
        self.player.armor = tileOfAction.armor;
    }
    else if (tileOfAction.healthEffect) {
        self.player.health = self.player.health + tileOfAction.healthEffect;
    }
    else if (tileOfAction.boss) {
        NSLog(@"%i",tileOfAction.boss.health);
        NSLog(@"%i", self.player.health);
        NSLog(@"%i", self.player.damage);
        tileOfAction.boss.health = tileOfAction.boss.health - self.player.damage;
        self.player.health = self.player.health - 15;
        NSLog(@"%i",tileOfAction.boss.health);
        NSLog(@"%i", self.player.health);
    }
    [self setTile];
    
    if (tileOfAction.boss && self.player.health > 0) {
        if (tileOfAction.boss.health <= 0) {
            UIAlertView *victoryMessage = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You beat the pirate boss!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [victoryMessage show];
        }
    } else if (self.player.health <= 0) {
        UIAlertView *deathMessage = [[UIAlertView alloc] initWithTitle:@"Failure!" message:@"You've died!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [deathMessage show];
    }
   
}

//Reset button needs to be worked on at the very end.
- (IBAction)resetGame:(id)sender {
    
    self.player = nil;
    PATile *bossArray = [[self.tiles objectAtIndex:2]objectAtIndex:3];
    bossArray.boss = nil;
    
    [self viewDidLoad];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Back to the beginning!" message:@"You've reset the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
}

- (IBAction)moveNorth:(id)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y+1);
    [self setTile];
    [self surroundingTilesExist];
}

- (IBAction)moveSouth:(id)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x, self.currentPoint.y-1);
    [self setTile];
    [self surroundingTilesExist];
}

- (IBAction)moveEast:(id)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x-1, self.currentPoint.y);
    [self setTile];
    [self surroundingTilesExist];
}

- (IBAction)moveWest:(id)sender {
    self.currentPoint = CGPointMake(self.currentPoint.x+1, self.currentPoint.y);
    [self setTile];
    [self surroundingTilesExist];
}
@end
