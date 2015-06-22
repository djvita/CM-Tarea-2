//
//  Intro.h
//  CM-Tarea-2
//
//  Created by vita on 6/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Intro : UIViewController
@property NSUInteger                                iPageIndex;
@property (strong, nonatomic) IBOutlet UIImageView *imgIntro;
@property (strong, nonatomic) IBOutlet UILabel *lblIntro;
@property (strong, nonatomic) IBOutlet UIButton *btnIntro;

- (IBAction)btnIntroPressed:(id)sender;

@end
