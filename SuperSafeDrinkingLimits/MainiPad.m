//
//  MainiPad.m
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 30/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import "MainiPad.h"
#import "MyProfile.h"
#import "BarTender.h"
#import "BACMath.h"
#import "Math.h"


@interface MainiPad ()

@end

@implementation MainiPad

static int mod=0;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}



-(void) callAfterSixtySecond:(NSTimer*) t
{
    [self Animate];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadAds];
	// Do any additional setup after loading the view.
     [self loadSettings];    
    
    // Cancel a preexisting timer.
    [self.repeatingTimer invalidate];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self selector:@selector(callAfterSixtySecond:)
                                                    userInfo:nil repeats:YES];
    self.repeatingTimer = timer;
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LoadDrinks:(id)sender {
    
    [self performSegueWithIdentifier: @"LoadAddDrink" sender: self];

}

- (IBAction)LoadMyProfile:(id)sender {
    [self performSegueWithIdentifier: @"LoadSettings" sender: self];

}

-(void) loadSettings
{
    //MyProfile* myPro = [[MyProfile alloc] init]; //First, we create an instance of SomeScript
    //[myPro LoadMyProfile]; //Next, we send the loggedIn message to our new instance
    
    
    [MyProfile LoadMyProfile];
    [BarTender LoadMyDrinks];
    
    NSString *GenderValue=[MyProfile getGender];
    
    if([GenderValue isEqualToString: @""])
    {
        //system didn't find any saved settings for profile.
        [self performSegueWithIdentifier: @"LoadSettings" sender: self]; //Load Settings
    }
    
    [self setStatus];
}

- (IBAction)btnResetClick:(id)sender {
    [self reSet];
}


-(void)reSet{
    
    
    [BarTender setNumberOfDrinks:0];
    [BarTender setDrinks:@""];
    [BACMath setBAC:0];
    [BarTender SaveMyDrinks];
    //SET BAC LABEL
    
    [self setStatus];
    
}


- (void) setStatus{
    
    
    NSString *noD = [NSString stringWithFormat:@"Add Drink (%d)", [BarTender getNumberOfDrink]];
    [_btnAddDrink setTitle:noD forState:UIControlStateNormal];
    
    int bac=(int)[BACMath getBAC];
    NSString *icon;
    
    if(bac<=0){
        icon=@"mb0.png";
        
    }else if (bac>12){
        icon=@"mb12.png";
    }else{
        
        NSString *genderVal=[MyProfile getGender];
        int ibac=(int) [BACMath getBAC];
        NSString *bacVal = [NSString stringWithFormat:@"%d", ibac];
        
        
		if([genderVal isEqualToString:@"Male"])
		{
            
            icon=[NSString stringWithFormat:@"mb%@.png",bacVal];
        }
		else
		{
            icon=[NSString stringWithFormat:@"fb%@.png", bacVal];
            
        }
		
        _mp.image = [UIImage imageNamed:icon];
        
    }
    
    [self setIcon];
    [self SetMonitor];
    
}

-(void) SetMonitor{
    
    
    _lbm.text  = [NSString stringWithFormat:@"BAC:%g",[BACMath getBAC]];
    
    
}

-(void) Animate{
	
    
	int bac=[BACMath getBAC];
    
	if(mod==0)
	{
        mod=1;
	}
	else
	{
        if(bac > 0)
        {
            if(bac <12)
                bac = bac - 1;
            else
                bac=11;
        }
		else
        {
            bac = 0;
            
        }
        
        mod=0;
	}
    
    
    NSString *icon;
    
    if(bac < 0)
    {
        icon =@ "mb0";
        
    }
    else if (bac > 12)
    {
        icon=@"mb12";
    }
    else
    {
        
        NSString *genderVal=[MyProfile getGender];
        int ibac=bac;
        NSString *bacVal = [NSString stringWithFormat:@"%d", ibac];
        
        
		if([genderVal isEqualToString:@"Male"])
		{
            
            icon=[NSString stringWithFormat:@"mb%@.png",bacVal];
        }
		else
		{
            icon=[NSString stringWithFormat:@"fb%@.png", bacVal];
            
        }
		
        _mp.image = [UIImage imageNamed:icon];
        
        
		
    }
    
    
    
}



-(void) setIcon{
    
    int bac= [BACMath getBAC];
    
    _nd1.hidden = YES;
    _nd2.hidden = YES;
    _cp.hidden  = YES;
    _nb.hidden  = YES;
    _hc.hidden  = YES;
    _hs.hidden  = YES;
    _pd.hidden  = YES;
    
    
    
    
    
    
    if(bac<1){
        
        
        _nd1.hidden = YES;
        _nd2.hidden = YES;
        _cp.hidden  = YES;
        _nb.hidden  = YES;
        _hc.hidden  = YES;
        _hs.hidden  = YES;
        _pd.hidden  = YES;
        
    }else if(bac > 0 && bac < 2){
        
        
        
        _nd1.hidden = NO;
        _nd2.hidden = YES;
        _cp.hidden  = YES;
        _nb.hidden  = YES;
        _hc.hidden  = YES;
        _hs.hidden  = YES;
        _pd.hidden  = YES;
        
    }else if (bac > 1 && bac < 5){
        
        
        _nd1.hidden = YES;
        _nd2.hidden = NO;
        _nb.hidden  = YES;
        _hc.hidden  = YES;
        _hs.hidden  = YES;
        _pd.hidden  = YES;
        
    } else if (bac > 4 && bac < 6){
        
        
        _nd1.hidden = YES;
        _nd2.hidden = NO;
        _cp.hidden  = NO;
        _nb.hidden  = YES;
        _hc.hidden  = YES;
        _hs.hidden  = YES;
        _pd.hidden  = YES;
        
    } else if (bac > 5 && bac < 8){
        
        
        _nd1.hidden = YES;
        _nd2.hidden = NO;
        _cp.hidden  = NO;
        _nb.hidden  = NO;
        _hc.hidden  = YES;
        _hs.hidden  = YES;
        _pd.hidden  = YES;
        
    }else if (bac > 7  && bac < 10){
        
        
        _nd1.hidden = YES;
        _nd2.hidden = NO;
        _cp.hidden  = NO;
        _nb.hidden  = NO;
        _hc.hidden  = NO;
        _hs.hidden  = YES;
        _pd.hidden  = YES;
        
    }else if (bac > 9 && bac < 12){
        
        
        
        _nd1.hidden = YES;
        _nd2.hidden = NO;
        _cp.hidden  = NO;
        _nb.hidden  = NO;
        _hc.hidden  = NO;
        _hs.hidden  = NO;
        _pd.hidden  = YES;
        
    }else if (bac > 11 ){
        
        _nd1.hidden = YES;
        _nd2.hidden = NO;
        _cp.hidden  = NO;
        _nb.hidden  = NO;
        _hc.hidden  = NO;
        _hs.hidden  = NO;
        _pd.hidden  = NO;
        
    }
    
    
    
}
-(void) loadAds{
    
    
    
    
    
    //YouTube
    
    
    // Create a view of the standard size at the bottom of the screen.
    bannerView_ = [[GADBannerView alloc] initWithAdSize:kGADAdSizeBanner];
    
    
    //Rotation of the AdMob Banner, change 0.0f for example to 0.5f
    //  CGAffineTransform makeLandscape = CGAffineTransformMakeRotation(M_PI * 0.0f);
    
    //and Position of the Banner, the values depends to the values of the CGRectMake of the bannerView_ object
    //  makeLandscape = CGAffineTransformTranslate(makeLandscape, 0, -400);
    //    bannerView_.transform = makeLandscape;
    
    
    // Specify the ad's "unit identifier." This is your AdMob Publisher ID.
    bannerView_.adUnitID = @"a1522e2a6f0d03f";
    
    // Let the runtime know which UIViewController to restore after taking
    // the user wherever the ad goes and add it to the view hierarchy.
    bannerView_.rootViewController = self;
    [self.view addSubview:bannerView_];
    
    // test devivce
	GADRequest *request = [GADRequest request];
	
	request.testDevices = [NSArray arrayWithObjects: GAD_SIMULATOR_ID, nil];
	
	// Initiate a generic request to load it with an ad.
    [bannerView_ loadRequest:request];
    
    
    
    
    
}


@end
