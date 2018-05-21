//
//  ViewController.m
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 15/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "ViewController.h"

#import "MainScreenViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)Tap:(id)sender {
    [self loadScene];
}
- (IBAction)Swipe:(id)sender {
    [self loadScene];
}

- (IBAction)Long:(id)sender {
    [self loadScene];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loadScene{

   /// MainScreenViewController *viewControllers = [[MainScreenViewController alloc] init];
 //   [self presentViewController:viewControllers animated:YES completion:nil];
    
    [self performSegueWithIdentifier: @"LoadMainScreen" sender: self];


}



- (IBAction)LoadiPadMain:(id)sender {
    
    [self performSegueWithIdentifier: @"LoadMainScreen" sender: self];
  
    
}

@end
