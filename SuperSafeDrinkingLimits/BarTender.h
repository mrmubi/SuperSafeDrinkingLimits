//
//  BarTender.h
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 17/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BarTender : NSObject


//Property Getters/Setters

//NOD Getter/Setter
+(int) getNumberOfDrink;
+(void) setNumberOfDrinks: (int) NoDValue;
//Drinks Gettter/Setter
+(NSString*) getDrinks;
+(void) setDrinks: (NSString*) DrinksValue;
//First Drink Getter/Stter
+(NSDate*) getFirstDrink;
+(void) setFirstDrink: (NSDate*) FirstDrinkValue;


//Methods
+(CGFloat) TimeSinceFirstDrink;
+(void) AddDrinks:(NSString*)DrinkType;
+(void) SaveMyDrinks;
+(void) LoadMyDrinks;

@end
