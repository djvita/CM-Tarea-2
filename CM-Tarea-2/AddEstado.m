//
//  AddEstado.m
//  CM-Tarea-2
//
//  Created by vita on 6/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "AddEstado.h"
#import "Declarations.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface AddEstado ()

@end

@implementation AddEstado

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    //keyboard dismiss
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//dismiss keyboard
-(void)dismissKeyboard {
    [_txtFEst resignFirstResponder];
    [_txtFPart resignFirstResponder];
}

//add image
- (IBAction)btnAddImagePressed:(id)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}



- (IBAction)btnSavePressed:(id)sender {
    [_txtFEst resignFirstResponder];
    [_txtFPart resignFirstResponder];
    //populate to the externs
    [maEstados addObject:self.txtFEst.text];
    [maPartidos addObject:self.txtFPart.text];

    //save the image in memory
    NSString *imgName = [self.txtFEst.text stringByAppendingString:@".png"];
    [imgName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
    [maImgsEstados addObject:imgName];
    UIImage *image = self.imageView.image;
    NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:imgName];
    [UIImagePNGRepresentation(image) writeToFile:cachedImagePath atomically:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)btnBackPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
