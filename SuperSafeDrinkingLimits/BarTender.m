//
//  BarTender.m
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 17/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "BarTender.h"
#import "BACMath.h"


@implementation BarTender

static int NumberOfDrinks=0;
static NSString *Drinks=@"";
static NSDate *FirstDrink;

//NOD Getter/Setter
+(int) getNumberOfDrink {return NumberOfDrinks;}
+(void) setNumberOfDrinks: (int) NoDValue;{
    NumberOfDrinks = NoDValue;
}

//Drinks Gettter/Setter
+(NSString*) getDrinks{ return Drinks;}
+(void) setDrinks: (NSString*) DrinksValue;{
    Drinks=DrinksValue;
}

//First Drink Getter/Stter
+(NSDate*) getFirstDrink{return FirstDrink;}
+(void) setFirstDrink: (NSDate*) FirstDrinkValue;{
    FirstDrink=FirstDrinkValue;
}


+(CGFloat) TimeSinceFirstDrink{
	
    //Date now=new Date();
    NSDate *now = [[NSDate alloc] init];
    /*
    NSDate *dT = [NSDate date];
    NSDateFormatter *dD = FirstDrink;//[[NSDateFormatter alloc] init];
    [dD setDateFormat:@"hh-mm"];
    NSString *resultString = [dD stringFromDate: dT];
    
    NSDate *nowT = [NSDate date];
    NSDateFormatter *nowD = [[NSDateFormatter alloc] init];
    [nowD setDateFormat:@"hh-mm"];
    NSString *resultString2 = [nowD stringFromDate: nowT];



    CGFloat difference = [now timeIntervalSinceDate:FirstDrink];
    
    int days = (int) (difference / (1000*60*60*24));
    int hours = (int) ((difference - (1000*60*60*24*days)) / (1000*60*60));
    int min = (int) (difference - (1000*60*60*24*days) - (1000*60*60*hours)) / (1000*60);
    */
    return 1;
    
}

+(void) AddDrinks:(NSString*)DrinkType;
{
    
    if(NumberOfDrinks==0){
        FirstDrink=[[NSDate alloc] init];//init date
    }
    
    NumberOfDrinks++;
    
   // NSString * strRR = [NSString stringWithFormat:@"%@%@%@", fileName, str, extension];

    Drinks=[NSString stringWithFormat:@"%@%@%@",Drinks, @",",DrinkType];
    
    [self SaveMyDrinks];
    
    [BACMath CalcBAC];
    
}

+(void) SaveMyDrinks
{
    [[NSUserDefaults standardUserDefaults] setInteger:NumberOfDrinks forKey:@"NoD"];
    [[NSUserDefaults standardUserDefaults] setObject:Drinks forKey:@"Drinks"];
    [[NSUserDefaults standardUserDefaults] setObject:FirstDrink forKey:@"FirstDrink"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+(void) LoadMyDrinks
{
    //SaveMyProfile(c);
    
    NumberOfDrinks = [[NSUserDefaults standardUserDefaults]  integerForKey:@"NoD"];
    Drinks = [[NSUserDefaults standardUserDefaults]  valueForKey:@"NoD"];
    FirstDrink = [[NSUserDefaults standardUserDefaults]  valueForKey:@"NoD"];
    
    [BACMath CalcBAC];
    
}

@end
