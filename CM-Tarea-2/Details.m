//
//  Details.m
//  CM-Tarea-2
//
//  Created by vita on 6/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Details.h"
#import "Declarations.h"

@interface Details ()

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initController {
    self.lblEstado.text   = maEstados[miCharacterIndex];
    
    if ([UIImage imageNamed:maImgsEstados[miCharacterIndex]]== nil) {
        NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:maImgsEstados[miCharacterIndex]];
        self.imgPart.image = [UIImage imageWithData:[NSData dataWithContentsOfFile: cachedImagePath]];
    }
    else{
        self.imgPart.image  = [UIImage imageNamed:maImgsEstados[miCharacterIndex]];
    }
    
    self.lblPartido.text = maEstados[miCharacterIndex];
}
/**********************************************************************************************/
#pragma mark - Buttons methods
/**********************************************************************************************/
- (IBAction)btnBackPressed:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
