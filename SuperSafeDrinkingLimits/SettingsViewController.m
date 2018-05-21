//
//  ViewController.m
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 15/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "SettingsViewController.h"
#import "MyProfile.h"
#import "Math.h"


@interface SettingsViewController ()

@end


@implementation SettingsViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int genderIndex=0;
    NSString *genderVal=[MyProfile getGender];
    
    int weightIndex=0;
    NSString *weightVal=[MyProfile getWeightUnit];
    
    if([genderVal isEqualToString: @"Male"])
    {
        genderIndex =0;
    }
    else
    {
        genderIndex=1;
    }
    
    _btnGender.selectedSegmentIndex =genderIndex;
    
    
    if([weightVal isEqualToString: @"kg"])
    {
        weightIndex =1;
    }
    else
    {
        weightIndex=0;
    }
    
    _btnWeightUnit.selectedSegmentIndex = weightIndex;
    
    
    _tbWeight.text =[NSString stringWithFormat:@"%d", [MyProfile getWeight] ];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (IBAction)xxx:(id)sender {
    
    NSString *genderVal;//=[MyProfile getGender];
    NSString *weightVal;//=[MyProfile getWeightUnit];
    
    if(_btnGender.selectedSegmentIndex == 0)
    {
        genderVal =@"Male";
    }
    else
    {
        genderVal = @"Female";
    }
        
    
    if(_btnWeightUnit.selectedSegmentIndex == 0)
    {
        weightVal =@"lb";
    }
    else
    {
        weightVal=@"kg";
    }
    

    // Converting String into Integer
    NSString *intString = _tbWeight.text;
    
    int value = [intString intValue];
    

    if((value < 50) || (value > 1500))
    {
        UIAlertView* mes=[[UIAlertView alloc] initWithTitle:@"Invalid Weight"
                                                 message:@"Please enter weight again. Value must be between 50 to 1500." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        mes.show;
    }
    
    else
    
    {
    
    
    [MyProfile setGender:genderVal];
    [MyProfile setWeightUnit:weightVal];
    [MyProfile setWeight:value];
    [MyProfile SaveMyProfile];
    
    
    [self performSegueWithIdentifier: @"ReLoadSettings" sender: self];
   
    }
    
 
}





@end
