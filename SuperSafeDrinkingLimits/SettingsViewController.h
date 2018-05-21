//
//  ViewController.h
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 15/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

//AddNewDrinkViewController

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController


@property (weak, nonatomic) IBOutlet UISegmentedControl *btnWeightUnit;
@property (weak, nonatomic) IBOutlet UITextField *tbWeight;
@property (weak, nonatomic) IBOutlet UISegmentedControl *btnGender;


@end
