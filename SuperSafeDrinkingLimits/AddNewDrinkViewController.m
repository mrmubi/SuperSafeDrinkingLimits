//
//  ViewController.m
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 15/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "AddNewDrinkViewController.h"
#import "MyProfile.h"
#import "BarTender.h"

@interface AddNewDrinkViewController ()

@end


@implementation AddNewDrinkViewController



- (IBAction)ImageTapped:(id)sender {
    
    [self SaveDrink];
    
    [self performSegueWithIdentifier: @"DrinkToLoadMainScreen" sender: self];
    
    
}

- (IBAction)ImgClick:(UITapGestureRecognizer *)sender {
    [self SaveDrink];
    
    [self performSegueWithIdentifier: @"DrinkToLoadMainScreen" sender: self];
    

    
}

- (IBAction)Imgclick2:(id)sender {
    [self SaveDrink];
    
    [self performSegueWithIdentifier: @"DrinkToLoadMainScreen" sender: self];
    

}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
}

-(void) SaveDrink{

    
    [BarTender AddDrinks:@""];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)xxx:(id)sender {
    
  //  [self performSegueWithIdentifier: @"ReLoadSettings" sender: self];
}



- (IBAction)TouchUpInside:(id)sender {

    [self performSegueWithIdentifier: @"DrinkToLoadMainScreen" sender: self];
   
    
}


@end
