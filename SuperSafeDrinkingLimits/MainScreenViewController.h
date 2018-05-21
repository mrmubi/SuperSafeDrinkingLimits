//
//  ViewController.h
//  SuperSafeDrinkingLimits
//
//  Created by Mubshir Raza Ali on 15/08/2013.
//  Copyright (c) 2013 Mubshir Raza Ali. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GADBannerView.h"

@interface MainScreenViewController : UIViewController
{
    GADBannerView *bannerView_;
}


@property (weak) NSTimer *repeatingTimer;
@property (strong) NSTimer *unregisteredTimer;

@property (weak, nonatomic) IBOutlet UIImageView *mp;

@property (weak, nonatomic) IBOutlet UILabel *lbm;

@property (weak, nonatomic) IBOutlet UIImageView *nd1;

@property (weak, nonatomic) IBOutlet UIImageView *nd2;

@property (weak, nonatomic) IBOutlet UIImageView *cp;

@property (weak, nonatomic) IBOutlet UIImageView *nb;

@property (weak, nonatomic) IBOutlet UIImageView *hc;

@property (weak, nonatomic) IBOutlet UIImageView *hs;

@property (weak, nonatomic) IBOutlet UIImageView *pd;

@property (weak, nonatomic) IBOutlet UIButton *btnReset;

@property (weak, nonatomic) IBOutlet UIButton *btnResetClick;

- (IBAction)btnReSetClickUp:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *btnAddDrinks;

@end
