//
//  BACMath.m
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 17/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "BACMath.h"
#import "BarTender.h"
#import "MyProfile.h"

@implementation BACMath

static double BAC=0;

+(void) CalcBAC{
    //BAC = (Standard Drinks * 0.06 * 100 * 1.055 / Weight * Gender Constant) - (0.015 * Hours)
   
    double alcohalConsumed=(12*[BarTender getNumberOfDrink]) * 0.06;
    double gravity= alcohalConsumed * 100 * 1.055;
    double genderWeight= [MyProfile GetWl] * [MyProfile GetGenderAlcohalConstant];
    double metabolised= 0.015 * [BarTender TimeSinceFirstDrink];
    
    double tempBac=(gravity) /( genderWeight);
    BAC= tempBac - metabolised;
    
    if (BAC < 1) {BAC=0;}
    
}

+(double)getBAC{

    if (BAC < 0)
    {
        return 0;
    }
    else
    {
        NSString *strBac= [NSString stringWithFormat: @"%.1f", BAC];
        double value = [strBac doubleValue];
        return value;
    }
}

+(void)setBAC:(double)BACValue;{
    BAC=BACValue;
}

@end
