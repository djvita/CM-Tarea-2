//
//  Details.h
//  CM-Tarea-2
//
//  Created by vita on 6/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Details : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imgPart;
@property (strong, nonatomic) IBOutlet UILabel *lblEstado;
@property (strong, nonatomic) IBOutlet UILabel *lblPartido;

- (IBAction)btnBackPressed:(id)sender;


@end
