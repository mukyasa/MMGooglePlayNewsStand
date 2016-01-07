//
//  ViewController.m
//  ObjCPlayStand
//
//  Created by Mukesh on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "ViewController.h"
#import "MMContainerViewController.h"
#import "MMTableViewController.h"
#import "MMCollectionViewController.h"
@interface ViewController ()
@property (nonatomic , strong ) MMContainerViewController *containerVC;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MMTableViewController *vc_one = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_one.title = @"Highlights";
    vc_one.logoColor = @"4caf50";
    vc_one.logoImage = @"highlights";
    
    MMTableViewController *vc_two = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_two.title = @"Sports";
    vc_two.logoColor = @"009688";
    vc_two.logoImage = @"sports";

    MMTableViewController *vc_three = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_three.title = @"Entertainment";
    vc_three.logoColor = @"673ab7";
    vc_three.logoImage = @"movie";

    MMTableViewController *vc_four = [self.storyboard instantiateViewControllerWithIdentifier:@"demo"];
    vc_four.title = @"News";
    vc_four.logoColor = @"ff9800";
    vc_four.logoImage = @"world";

    
    MMCollectionViewController *vc_five = [self.storyboard instantiateViewControllerWithIdentifier:@"collection"];
    vc_five.title = @"Technology";
    vc_five.logoColor = @"9c27b0";
    vc_five.logoImage = @"tech";


    
    self.containerVC = [[MMContainerViewController alloc] initWithControllers:@[vc_one , vc_two , vc_three , vc_four,vc_five] parentViewController:self];
    vc_one.scrolldeleagte = self.containerVC ;
    vc_two.scrolldeleagte = self.containerVC ;
    vc_three.scrolldeleagte = self.containerVC ;
    vc_four.scrolldeleagte = self.containerVC ;
    vc_five.scrolldeleagte = self.containerVC ;
    
    self.containerVC.itemViewColorArray = @[@"4caf50",@"009688",@"673ab7",@"ff9800",@"9c27b0"];
    self.containerVC.menuItemFont = [UIFont fontWithName:@"Roboto-Medium" size:15];
    self.containerVC.menuIndicatorColor = [UIColor whiteColor];
    [self.view addSubview:self.containerVC.view];
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
