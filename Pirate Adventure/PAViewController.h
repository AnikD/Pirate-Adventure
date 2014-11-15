//
//  PAViewController.h
//  Pirate Adventure
//
//  Created by Shafqat Dulal on 6/12/14.
//  Copyright (c) 2014 SD Tech. All rights reserved.
//
//  Attempt before looking at entire solution.

#import <UIKit/UIKit.h>
#import "PACharacter.h"

@interface PAViewController : UIViewController

@property (nonatomic) CGPoint currentPoint; //For keeping track where
@property (strong, nonatomic) NSArray *tiles; //Done to allow for access to tiles in all methods.
@property (strong, nonatomic) PACharacter *player; //Character's properties accessible in any method.

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *characterHealth;
@property (strong, nonatomic) IBOutlet UILabel *characterDamage;
@property (strong, nonatomic) IBOutlet UILabel *characterWeapon;
@property (strong, nonatomic) IBOutlet UILabel *characterArmor;
@property (strong, nonatomic) IBOutlet UIButton *actionButtonLabel;
@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UIButton *northButton;
@property (strong, nonatomic) IBOutlet UIButton *southButton;
@property (strong, nonatomic) IBOutlet UIButton *eastButton;
@property (strong, nonatomic) IBOutlet UIButton *westButton;

- (IBAction)actionButton:(id)sender;
- (IBAction)resetGame:(id)sender;
- (IBAction)moveNorth:(id)sender;
- (IBAction)moveSouth:(id)sender;
- (IBAction)moveEast:(id)sender;
- (IBAction)moveWest:(id)sender;


@end
