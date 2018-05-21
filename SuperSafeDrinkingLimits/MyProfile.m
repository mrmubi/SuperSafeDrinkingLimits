//
//  MyProfile.m
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 17/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "MyProfile.h"
#import "BACMath.h"


@implementation MyProfile


/*

@synthesize Gender;
@synthesize Age;
@synthesize Weight;
@synthesize WeightUnit;
@synthesize Weightlbs;

*/

static NSString *Gender;
static int  Age;
static int Weight;
static NSString *WeightUnit;
static double Weightlbs;


+(double) GetGenderAlcohalConstant
{

    if(true)//[Gender isEqualToString: @"Male"])
    {
        
        return 0.68;
        
    }
    else
    {
        return 0.55;
    }
    
    
}

+(double)  GetWl
{
	
    if([WeightUnit isEqualToString: @"kg"]){
        Weightlbs=Weight * 2.2;
    }else{
        
        Weightlbs=Weight;
    }
    
    return Weightlbs;
}

+(void) SaveMyProfile //(Context c)
{
    
    [[NSUserDefaults standardUserDefaults] setObject:Gender forKey:@"Gender"];
    [[NSUserDefaults standardUserDefaults] setInteger:Weight forKey:@"Weight"];
    [[NSUserDefaults standardUserDefaults] setObject:WeightUnit forKey:@"Unit"];
    [[NSUserDefaults standardUserDefaults] synchronize];
 
    
}

+(void) LoadMyProfile
{
    
    Gender = [[NSUserDefaults standardUserDefaults]  valueForKey:@"Gender"];
    Weight = [[NSUserDefaults standardUserDefaults]  integerForKey:@"Weight"];
    WeightUnit = [[NSUserDefaults standardUserDefaults]  valueForKey:@"Unit"];
    
    [BACMath CalcBAC];
    
}

//Gender Getter/Setter;
+(NSString*) getGender{return Gender;}
+(void) setGender:(NSString*)GenderValue;{
    Gender=GenderValue;
}

//Weight Getter/Setter
+(int) getWeight{return Weight;}
+(void) setWeight:(int)WeightValue;{
    Weight=WeightValue;
}

//Weight Unit Getter/Setter
+(NSString*) getWeightUnit{return WeightUnit;};
+(void) setWeightUnit:(NSString *)WeightUnitValue;{
    WeightUnit=WeightUnitValue;
}

+(double) getWeightlbs{return Weightlbs;}
-(void) setWeightlbs:(double)WeightUnitValue;{
    Weightlbs = WeightUnitValue;
}


@end
