//
//  Home.m
//  CM-Tarea-2
//
//  Created by vita on 6/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Home.h"
#import "Declarations.h"
#import "cellPol.h"
#import "Intro.h"
#import "AddEstado.h"
#import "Details.h"

@interface Home ()

@end

@implementation Home

/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
-(void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//-------------------------------------------------------------------------------
-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated // new
{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    
    [self.tabla reloadData];
    
}
//-------------------------------------------------------------------------------
-(void)initController {
    maEstados             = [[NSMutableArray alloc] initWithObjects:
                             @"Jalisco",
                             @"Yucatan",
                             @"Sonora",
                             @"Sinaloa",
                             @"Nayarit",
                             @"Baja California",
                             @"DF",
                             @"Oaxaca",
                             nil
                             ];
    
    maPartidos             = [[NSMutableArray alloc] initWithObjects:
                             @"PRI",
                             @"PAN",
                             @"PRD",
                             @"Movimiento Ciudadano",
                             @"Morena",
                             @"PT",
                             @"PRI",
                             @"Movimiento Ciudadano",
                             nil
                             ];
    
    maImgsEstados         = [[NSMutableArray alloc] initWithObjects:
                             @"pri.png",
                             @"pan.png",
                             @"pri.png",
                             @"prd.png",
                             @"mc.jpg",
                             @"pt.png",
                             @"pri.png",
                             @"mc.jpg",
                             nil];
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maEstados.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    cellPol *cell = (cellPol *)[tableView dequeueReusableCellWithIdentifier:@"cellPol"];
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellPol" bundle:nil] forCellReuseIdentifier:@"cellPol"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellPol"];
    }
    //Fill cell with info from arrays
    cell.lblEst.text    =  maEstados[indexPath.row];
    cell.lblPart.text   =  maPartidos[indexPath.row];
    
    //check if thre arent any images in the cell and load it from memory
    if ([UIImage imageNamed:maImgsEstados[indexPath.row]]== nil) {
        NSString *cachedFolderPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        NSString *cachedImagePath = [cachedFolderPath stringByAppendingPathComponent:maImgsEstados[indexPath.row]];
        cell.imgPol.image = [UIImage imageWithData:[NSData dataWithContentsOfFile: cachedImagePath]];
    }
    else{
        cell.imgPol.image   =  [UIImage imageNamed:maImgsEstados[indexPath.row]];
    }
    
    cell.clipsToBounds  = YES;
    [cell.contentView.superview setClipsToBounds:YES];
    
    
    return cell;
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miCharacterIndex = (int)indexPath.row;
    Details *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Details"];
    
    [self presentViewController:viewController animated:YES completion:nil];
    
}
- (IBAction)btnAddPressed:(id)sender {
    AddEstado *addEst= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"AddEstado"];
    
    [self presentViewController:addEst animated:YES completion:nil];
    
}
@end
