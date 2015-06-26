//
//  ViewController.m
//  CM-Tarea-2
//
//  Created by vita on 6/22/15.
//  Copyright (c) 2015 vita. All rights reserved.
//

#import "Start.h"
#import "Intro.h"
#import "Home.h"
#import "Declarations.h"

@interface Start ()

@end
/**********************************************************************************************/
#pragma mark - Initialization methods
/**********************************************************************************************/
@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}
//-------------------------------------------------------------------------------
- (void)viewDidAppear:(BOOL)animated {
    mUserDefaults       = [NSUserDefaults standardUserDefaults];
    NSString *stTemp    = [mUserDefaults objectForKey:@"firstTimeCheck"];
    NSLog(@"firstTimeCheck = %@", stTemp);
    //From phone memory
    if ([stTemp isEqual:@"YES"]) {
        //User has seen the intro before, skip intro
        Home *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Home"];
        [self presentViewController:vc animated:YES completion:nil];
    }
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//-------------------------------------------------------------------------------
- (void)initController {
    maIntroTitles   = [[NSMutableArray alloc] initWithObjects: @"Ve tu estado\ny su partido politico", @"Ve a detalle su informacion", @"Agrega otro Estado", nil];
    maIntroImgs     = [[NSMutableArray alloc] initWithObjects: @"img1.png", @"img2.jpg", @"img3.png", nil];
    
    [self createPageViews];
}
/**********************************************************************************************/
#pragma mark - Page controller methods and delegates
/**********************************************************************************************/
- (void)createPageViews {
    // Create page view controller
    self.pageViewController             = [self.storyboard instantiateViewControllerWithIdentifier:@"PageIntroController"];
    self.pageViewController.dataSource  = self;
    
    Intro *startingViewController       = [self viewControllerAtIndex:0];
    NSArray *viewControllers            = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    // Change the size of page view controller
    self.pageViewController.view.frame  = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    NSArray *subviews = self.pageViewController.view.subviews;
    UIPageControl *thisControl = nil;
    for (int i=0; i<[subviews count]; i++) {
        if ([[subviews objectAtIndex:i] isKindOfClass:[UIPageControl class]]) {
            thisControl = (UIPageControl *)[subviews objectAtIndex:i];
        }
    }
    thisControl.hidden = true;
}
//-------------------------------------------------------------------------------
- (Intro *)viewControllerAtIndex:(NSUInteger)index
{
    if (([maIntroTitles count] == 0) || (index >= [maIntroTitles count])) {
        return nil;
    }
    // Create a new view controller and pass suitable data.
    Intro *pageIntro        = [self.storyboard instantiateViewControllerWithIdentifier:@"Intro"];
    pageIntro.lblIntro      = maIntroTitles[index];
    pageIntro.imgIntro      = maIntroImgs[index];
    pageIntro.iPageIndex    = index;
    
    return pageIntro;
}
//-------------------------------------------------------------------------------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((Intro*) viewController).iPageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}
//-------------------------------------------------------------------------------
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((Intro*) viewController).iPageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    return [self viewControllerAtIndex:index];
}
//-------------------------------------------------------------------------------
- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [maIntroTitles count];
}
//-------------------------------------------------------------------------------
- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end

