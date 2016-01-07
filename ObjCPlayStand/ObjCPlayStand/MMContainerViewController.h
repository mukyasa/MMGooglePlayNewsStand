//
//  MMContainerViewController.h
//  ObjCPlayStand
//
//  Created by Mukesh on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "JBKenBurnsView.h"
#import "UIColor+HexRepresentation.h"
@protocol MMContainerViewControllerDelegate <NSObject>

- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller;

@end

@interface MMContainerViewController : UIViewController <ScrollHeader>
@property (nonatomic, weak) id <MMContainerViewControllerDelegate> delegate;

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong, readonly) NSMutableArray *titles;
@property (nonatomic, strong, readonly) NSMutableArray *childControllers;
@property (nonatomic, strong) NSArray *itemViewColorArray;
@property (nonatomic, strong) UIFont  *menuItemFont;
@property (nonatomic, strong) UIColor *menuItemTitleColor;
@property (nonatomic, strong) UIColor *menuItemSelectedTitleColor;
@property (nonatomic, strong) UIColor *menuBackGroudColor;
@property (nonatomic, strong) UIColor *menuIndicatorColor;

- (id)initWithControllers:(NSArray *)controllers
     parentViewController:(UIViewController *)parentViewController;

-(void)scrollTheHeader:(CGPoint)contentOffset;
@end
