//
//  MyProfile.h
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 17/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyProfile :  NSObject


//properties
/*
@property (nonatomic) NSString *Gender;
@property (nonatomic) int  Age;
@property (nonatomic) int Weight;
@property (nonatomic) NSString *WeightUnit;
@property (nonatomic) double Weightlbs;
*/

//properties
+(NSString*) getGender;
+(void) setGender:(NSString*)GenderValue;

+(int) getWeight;
+(void) setWeight:(int)WeightValue;

+(NSString*) getWeightUnit;
+(void) setWeightUnit:(NSString *)WeightUnitValue;

+(double) getWeightlbs;
-(void) setWeightlbs:(NSString *)WeightUnitValue;


//methods
+(double) GetGenderAlcohalConstant;
+(double)  GetWl;
+(void) SaveMyProfile;
+(void) LoadMyProfile;

@end
