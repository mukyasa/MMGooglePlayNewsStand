//
//  PlayListTableViewCell.h
//  ObjCPlayStand
//
//  Created by Mukesh on 06/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerImage;
@property (weak, nonatomic) IBOutlet UILabel *titleNews;
@property (weak, nonatomic) IBOutlet UILabel *descNews;
@property (weak, nonatomic) IBOutlet UIView *middleView;

@end
