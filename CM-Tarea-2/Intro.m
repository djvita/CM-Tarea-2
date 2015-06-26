//
//  Intro.m
//  CM-Tarea-2
//
//  Created by vita on 6/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Intro.h"
#import "Home.h"
#import "Declarations.h"

@interface Intro ()

@end

@implementation Intro

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Round user image and add a white border
    self.btnIntro.layer.borderColor    = [UIColor clearColor].CGColor;
    self.btnIntro.layer.borderWidth    = 2.0;
    self.btnIntro.clipsToBounds        = YES;
    self.btnIntro.layer.cornerRadius   = 4;
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
-(void)viewWillAppear:(BOOL)animated {
    self.lblIntro.text  = maIntroTitles[self.iPageIndex];
    self.imgIntro.image = [UIImage imageNamed:maIntroImgs[self.iPageIndex]];
    if (self.iPageIndex == 2)
    {
        self.btnIntro.hidden = NO;
    }
}
//-------------------------------------------------------------------------------
- (IBAction)btnIntroPressed:(id)sender
{
    [mUserDefaults setObject: @"YES" forKey: @"firstTimeCheck"];
    NSString *stTemp = [mUserDefaults objectForKey:@"firstTimeCheck"];
    NSLog(@"firstTimeCheck = %@", stTemp);
    
    Home *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Home"];
    [self presentViewController:vc animated:YES completion:nil];
}


@end

