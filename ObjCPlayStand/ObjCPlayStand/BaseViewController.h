//
//  BaseViewController.h
//  ObjCPlayStand
//
//  Created by Mukesh on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ScrollHeader <NSObject>

-(void)scrollTheHeader:(CGPoint)contentOffset;

@end
@interface BaseViewController : UIViewController
@property (nonatomic , strong) id <ScrollHeader> scrolldeleagte;
@property (strong,nonatomic) NSString *logoColor;
@property (strong,nonatomic) NSString *logoImage;
@end
