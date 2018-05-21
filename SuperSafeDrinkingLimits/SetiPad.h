//
//  SetiPad.h
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 30/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetiPad : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *btnGender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *btnWeightUnit;
@property (weak, nonatomic) IBOutlet UITextField *tbWeight;


@end
