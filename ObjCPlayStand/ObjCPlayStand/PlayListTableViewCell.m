//
//  PlayListTableViewCell.m
//  ObjCPlayStand
//
//  Created by Mukesh on 06/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "PlayListTableViewCell.h"
#import "UIColor+HexRepresentation.h"
@implementation PlayListTableViewCell

- (void)awakeFromNib {
    // Initialization code
    _titleNews.font=[UIFont fontWithName:@"Roboto-Medium" size:18];
    _descNews.font=[UIFont fontWithName:@"Roboto-Medium" size:14];
    _descNews.textColor=[UIColor lightGrayColor];
    _headerImage.clipsToBounds=true;
    _headerImage.contentMode=UIViewContentModeScaleAspectFill;
//    _middleView.backgroundColor = [UIColor colorWithHexString:@"e5e5ee5"];
    _middleView.layer.shadowColor=[UIColor blackColor].CGColor;
    _middleView.layer.shadowRadius = 8.0;
    _middleView.layer.shadowOpacity  = 1.0;
    _middleView.layer.masksToBounds=true;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
