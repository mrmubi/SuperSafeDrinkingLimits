//
//  DrinkiPad.m
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 30/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "DrinkiPad.h"
#import "MyProfile.h"
#import "BarTender.h"
#import "BACMath.h"
#import "Math.h"


@interface DrinkiPad ()

@end

@implementation DrinkiPad




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LoadMainScreen:(id)sender {
    [self saveDrink];
    [self performSegueWithIdentifier: @"DrinkToLoadMainScreen" sender: self];

}

-(void)saveDrink{
    [BarTender AddDrinks:@""];
}

- (IBAction)ImageTapped:(id)sender {
    
    [self saveDrink];
    
    [self performSegueWithIdentifier: @"DrinkToLoadMainScreen" sender: self];
    

}

- (IBAction)SwipClick:(id)sender {
    
    [self saveDrink];
    
    [self performSegueWithIdentifier: @"DrinkToLoadMainScreen" sender: self];
    

}


@end
