//
//  AddEstado.h
//  CM-Tarea-2
//
//  Created by vita on 6/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEstado : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate >

@property (strong, nonatomic) IBOutlet UITextField *txtFEst;

@property (strong, nonatomic) IBOutlet UITextField *txtFPart;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)btnAddImagePressed:(id)sender;
- (IBAction)btnSavePressed:(id)sender;
- (IBAction)btnBackPressed:(id)sender;



@end
