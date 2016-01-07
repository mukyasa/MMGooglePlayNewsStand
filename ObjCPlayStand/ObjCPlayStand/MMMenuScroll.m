//
//  MMMenuScroll.m
//  ObjCPlayStand
//
//  Created by Mukesh on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "MMMenuScroll.h"
static const CGFloat kMMScrollMenuViewWidth  = 90;
static const CGFloat kMMScrollMenuViewMargin = 20;
static const CGFloat kMMIndicatorHeight = 3;
@interface MMMenuScroll ()
@property (nonatomic, strong) UIView *indicatorView;
@end

@implementation MMMenuScroll

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // default
        _viewbackgroudColor = [UIColor whiteColor];
        _itemfont = [UIFont systemFontOfSize:16];
        _itemTitleColor = [UIColor colorWithRed:0.866667 green:0.866667 blue:0.866667 alpha:1.0];
        _itemSelectedTitleColor = [UIColor colorWithRed:0.333333 green:0.333333 blue:0.333333 alpha:1.0];
        _itemIndicatorColor = [UIColor colorWithRed:0.168627 green:0.498039 blue:0.839216 alpha:1.0];
        
        self.backgroundColor = _viewbackgroudColor;
        _scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
        _scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:_scrollView];
    }
    return self;
}

#pragma mark -- Setter

- (void)setViewbackgroudColor:(UIColor *)viewbackgroudColor
{
    if (!viewbackgroudColor) { return; }
    _viewbackgroudColor = viewbackgroudColor;
    self.backgroundColor = viewbackgroudColor;
}

- (void)setItemfont:(UIFont *)itemfont
{
    if (!itemfont) { return; }
    _itemfont = itemfont;
    for (UILabel *label in _itemTitleArray) {
        label.font = itemfont;
    }
}

- (void)setItemTitleColor:(UIColor *)itemTitleColor
{
    if (!itemTitleColor) { return; }
    _itemTitleColor = itemTitleColor;
    for (UILabel *label in _itemTitleArray) {
        label.textColor = itemTitleColor;
    }
}

- (void)setItemIndicatorColor:(UIColor *)itemIndicatorColor
{
    if (!itemIndicatorColor) { return; }
    _itemIndicatorColor = itemIndicatorColor;
    _indicatorView.backgroundColor = itemIndicatorColor;
}

- (void)setItemTitleArray:(NSArray *)itemTitleArray
{
    if (_itemTitleArray != itemTitleArray) {
        _itemTitleArray = itemTitleArray;
        NSMutableArray *views = [NSMutableArray array];

        for (int i = 0; i < itemTitleArray.count; i++) {
            CGRect frame = CGRectMake(0, 40, kMMScrollMenuViewWidth, CGRectGetHeight(self.frame));
            UILabel *itemView = [[UILabel alloc] initWithFrame:frame];
            [self.scrollView addSubview:itemView];
            itemView.tag = i;
            itemView.text = [itemTitleArray[i] uppercaseString];
            itemView.userInteractionEnabled = YES;
            itemView.backgroundColor = [UIColor clearColor];
            itemView.textAlignment = NSTextAlignmentCenter;
            itemView.font = self.itemfont;
            itemView.textColor = _itemTitleColor;
            itemView.frame  = CGRectMake(0, 40, itemView.intrinsicContentSize.width, CGRectGetHeight(self.frame));
            [views addObject:itemView];

            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemViewTapAction:)];
            [itemView addGestureRecognizer:tapGesture];
        }

        self.itemViewArray = [NSArray arrayWithArray:views];

        // indicator
        _indicatorView = [[UIView alloc]init];
//        _indicatorView.frame = CGRectMake(10, _scrollView.frame.size.height - kMMIndicatorHeight, kMMScrollMenuViewWidth, kMMIndicatorHeight);
        self.indicatorView.frame = CGRectMake(((UILabel *)_itemViewArray[0]).frame.origin.x, _scrollView.frame.size.height - kMMIndicatorHeight, CGRectGetWidth(((UILabel *)_itemViewArray[0]).frame) + kMMScrollMenuViewMargin*2, kMMIndicatorHeight);
        NSLog(@"%@",_indicatorView);
        _indicatorView.backgroundColor = self.itemIndicatorColor;
        [_scrollView addSubview:_indicatorView];
    }
}

- (void)setItemTitleArray:(NSArray *)itemTitleArray withImages:(NSArray *)itemImageArray
{
    if (_itemTitleArray != itemTitleArray) {
        _itemTitleArray = itemTitleArray;
        NSMutableArray *views = [NSMutableArray array];
        NSMutableArray *images = [NSMutableArray array];
        for (int i = 0; i < itemTitleArray.count; i++) {
            CGRect frameBackground = CGRectMake(0, 0, kMMScrollMenuViewWidth, CGRectGetHeight(self.frame) );
            UIView *background = [[UIView alloc] initWithFrame:frameBackground];
            
            
            //Image
            CGRect frameBut = CGRectMake(0, 0, kMMScrollMenuViewWidth, CGRectGetHeight(self.frame) - 20);
            UIButton *itemBut = [UIButton buttonWithType:UIButtonTypeCustom];
            itemBut.frame = frameBut;
            itemBut.userInteractionEnabled = NO;
            [itemBut setImage:itemImageArray[i] forState:UIControlStateNormal];
            
            
            //Label
            CGRect frame = CGRectMake(0, 40, kMMScrollMenuViewWidth, CGRectGetHeight(self.frame) - 40);
            UILabel *itemView = [[UILabel alloc] initWithFrame:frame];
            
            [background addSubview:itemView];
            [background addSubview:itemBut];
            
            //            [self.scrollView addSubview:itemBut];
            //            [self.scrollView addSubview:itemView];
            [self.scrollView addSubview:background];
            background.tag = i;
            itemView.text = itemTitleArray[i];
            background.userInteractionEnabled = YES;
            itemView.backgroundColor = [UIColor clearColor];
            itemView.textAlignment = NSTextAlignmentCenter;
            itemView.font = self.itemfont;
            itemView.textColor = _itemTitleColor;
            
            [views addObject:itemView];
            [images addObject:background];
            
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(itemViewTapAction:)];
            [background addGestureRecognizer:tapGesture];
        }
        
        self.itemViewArray = [NSArray arrayWithArray:views];
        self.itemImageArray = [NSArray arrayWithArray:images];
        // indicator
        _indicatorView = [[UIView alloc]init];
//        _indicatorView.frame = CGRectMake(10, _scrollView.frame.size.height - kMMIndicatorHeight, kMMScrollMenuViewWidth, kMMIndicatorHeight);
        
        _indicatorView.backgroundColor = self.itemIndicatorColor;
        [_scrollView addSubview:_indicatorView];
    }
}


#pragma mark -- public

- (void)setIndicatorViewFrameWithRatio:(CGFloat)ratio isNextItem:(BOOL)isNextItem toIndex:(NSInteger)toIndex
{
    CGFloat indicatorX = 0.0;
    if (isNextItem) {
        indicatorX = ((kMMScrollMenuViewMargin + kMMScrollMenuViewWidth) * ratio ) + (toIndex * kMMScrollMenuViewWidth) + ((toIndex + 1) * kMMScrollMenuViewMargin);
    } else {
        indicatorX =  ((kMMScrollMenuViewMargin + kMMScrollMenuViewWidth) * (1 - ratio) ) + (toIndex * kMMScrollMenuViewWidth) + ((toIndex + 1) * kMMScrollMenuViewMargin);
    }
    
    if (indicatorX < kMMScrollMenuViewMargin || indicatorX > self.scrollView.contentSize.width - (kMMScrollMenuViewMargin + kMMScrollMenuViewWidth)) {
        return;
    }
    _indicatorView.frame = CGRectMake(indicatorX, _scrollView.frame.size.height - kMMIndicatorHeight, kMMScrollMenuViewWidth, kMMIndicatorHeight);
//     _indicatorView.frame = CGRectMake(indicatorX, _scrollView.frame.size.height - kMMIndicatorHeight, ((UILabel *)self.itemViewArray[toIndex]).frame.size.width, kMMIndicatorHeight);
    //  NSLog(@"retio : %f",_indicatorView.frame.origin.x);
}

- (void)setItemTextColor:(UIColor *)itemTextColor
    seletedItemTextColor:(UIColor *)selectedItemTextColor
            currentIndex:(NSInteger)currentIndex
{
    if (itemTextColor) { _itemTitleColor = itemTextColor; }
    if (selectedItemTextColor) { _itemSelectedTitleColor = selectedItemTextColor; }
    
    for (int i = 0; i < self.itemViewArray.count; i++) {
        UILabel *label = self.itemViewArray[i];
        if (i == currentIndex) {
            label.alpha = 0.0;
            [UIView animateWithDuration:0.75
                                  delay:0.0
                                options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAllowUserInteraction
                             animations:^{
                                 label.alpha = 1.0;
                                 label.textColor = _itemSelectedTitleColor;
                             } completion:^(BOOL finished) {
                             }];
        } else {
            label.textColor = _itemTitleColor;
        }
    }
}

#pragma mark -- private

// menu shadow
- (void)setShadowView
{
    UIView *view = [[UIView alloc]init];
    view.frame = CGRectMake(0, self.frame.size.height - 0.5, CGRectGetWidth(self.frame), 0.5);
    view.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:view];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat x = kMMScrollMenuViewMargin;
    for (NSUInteger i = 0; i < self.itemViewArray.count; i++) {
//        CGFloat width = kMMScrollMenuViewWidth;
        UIView *itemView = self.itemViewArray[i];
        itemView.frame = CGRectMake(x, 0, itemView.intrinsicContentSize.width, self.scrollView.frame.size.height);
        
        x += itemView.intrinsicContentSize.width + kMMScrollMenuViewMargin;
    }
    self.scrollView.contentSize = CGSizeMake(x, self.scrollView.frame.size.height);
    
    CGRect frame = self.scrollView.frame;
    if (self.frame.size.width > x) {
        frame.origin.x = (self.frame.size.width - x) / 2;
        frame.size.width = x;
    } else {
        frame.origin.x = 0;
        frame.size.width = self.frame.size.width;
    }
    self.scrollView.frame = frame;
    self.indicatorView.frame = CGRectMake(((UILabel *)_itemViewArray[0]).frame.origin.x-kMMScrollMenuViewMargin/2, _indicatorView.frame.origin.y, CGRectGetWidth(((UILabel *)_itemViewArray[0]).frame) + kMMScrollMenuViewMargin, CGRectGetHeight(_indicatorView.frame));
//    NSLog(@"%@",self.itemViewArray);
}

#pragma mark -- Selector --------------------------------------- //
- (void)itemViewTapAction:(UITapGestureRecognizer *)Recongnizer
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollMenuViewSelectedIndex:)]) {
        [self updateIndicator:[(UIGestureRecognizer*) Recongnizer view].tag];
        [self.delegate scrollMenuViewSelectedIndex:[(UIGestureRecognizer*) Recongnizer view].tag];
        
    }
}

#pragma mark updateIndicator

-(void)updateIndicator:(NSInteger)toIndex{
    [UIView animateWithDuration:.5 animations:^{
        self.indicatorView.frame = CGRectMake(((UILabel *)_itemViewArray[toIndex]).frame.origin.x - kMMScrollMenuViewMargin/2, _indicatorView.frame.origin.y, CGRectGetWidth(((UILabel *)_itemViewArray[toIndex]).frame) + kMMScrollMenuViewMargin, CGRectGetHeight(_indicatorView.frame));
//        self.scrollView.scrollRectToVisible(self.labels[self.currentPage].frame, animated: true)
        [self.scrollView scrollRectToVisible:self.indicatorView.frame  animated:YES];
    }];
   
}

@end

