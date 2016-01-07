//
//  MMMenuScroll.h
//  ObjCPlayStand
//
//  Created by Mukesh on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MMScrollMenuViewDelegate <NSObject>

- (void)scrollMenuViewSelectedIndex:(NSInteger)index;

@end
@interface MMMenuScroll : UIView

@property (nonatomic, weak) id <MMScrollMenuViewDelegate> delegate;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *itemTitleArray;
@property (nonatomic, strong) NSArray *itemViewArray;
@property (nonatomic, strong) NSArray *itemImageArray;


@property (nonatomic, strong) UIColor *viewbackgroudColor;
@property (nonatomic, strong) UIFont *itemfont;
@property (nonatomic, strong) UIColor *itemTitleColor;
@property (nonatomic, strong) UIColor *itemSelectedTitleColor;
@property (nonatomic, strong) UIColor *itemIndicatorColor;

- (void)setShadowView;

- (void)setIndicatorViewFrameWithRatio:(CGFloat)ratio isNextItem:(BOOL)isNextItem toIndex:(NSInteger)toIndex;

- (void)setItemTextColor:(UIColor *)itemTextColor
    seletedItemTextColor:(UIColor *)selectedItemTextColor
            currentIndex:(NSInteger)currentIndex;
-(void)updateIndicator:(NSInteger)toIndex;

@end
