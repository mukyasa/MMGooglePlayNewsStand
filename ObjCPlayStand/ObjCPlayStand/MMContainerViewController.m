//
//  MMContainerViewController.m
//  ObjCPlayStand
//
//  Created by Mukesh on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "MMContainerViewController.h"
#import "MMMenuScroll.h"
#import "UIView+MaterialDesign.h"
static const CGFloat kMMScrollMenuViewHeight = 50;
static const CGFloat topBarHeight = 64;
static const CGFloat header = 250;
static const CGFloat headerScrollOffset = -100;
static const CGFloat headerMargin = 50;
@interface MMContainerViewController ()<UIScrollViewDelegate , MMScrollMenuViewDelegate>{
    UIView *viewCover, *alphaBanner , *navBar;
    NSArray *images;
    BOOL showStatus;
    NSString *currentColor;
    UILabel *navTitle;
}
@property (nonatomic, assign) CGFloat topBarHeight;
@property (nonatomic, assign) NSInteger currentIndex;
@property (nonatomic, strong) MMMenuScroll *menuView;
@end

@implementation MMContainerViewController

- (id)initWithControllers:(NSArray *)controllers
     parentViewController:(UIViewController *)parentViewController
{
    self = [super init];
    if (self) {
        
        [parentViewController addChildViewController:self];
        [self didMoveToParentViewController:parentViewController];
        
        _topBarHeight = topBarHeight;
        _titles = [[NSMutableArray alloc] init];
        _itemViewColorArray = [[NSMutableArray alloc] init];
        _childControllers = [[NSMutableArray alloc] init];
        _childControllers = [controllers mutableCopy];
        
        NSMutableArray *titles = [NSMutableArray array];
        for (UIViewController *vc in _childControllers) {
            [titles addObject:[vc valueForKey:@"title"]];
        }
        _titles = [titles mutableCopy];
        images = @[[UIImage imageNamed:@"ironman.jpg"],[UIImage imageNamed:@"worldbg.jpg"],[UIImage imageNamed:@"sportsbg.jpg"],[UIImage imageNamed:@"applebg.png"],[UIImage imageNamed:@"businessbg.jpg"]];

    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //HEADER
    [self setupHeader];
    
    // ContentScrollview setup
    _contentScrollView = [[UIScrollView alloc]init];
    _contentScrollView.frame = CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height);
    
    _contentScrollView.backgroundColor = [UIColor clearColor];
    _contentScrollView.pagingEnabled = YES;
    _contentScrollView.delegate = self;
    _contentScrollView.showsHorizontalScrollIndicator = NO;
    _contentScrollView.scrollsToTop = NO;
//    [self.view addSubview:_contentScrollView];
    [self.view insertSubview:_contentScrollView aboveSubview:viewCover];
    _contentScrollView.contentSize = CGSizeMake(_contentScrollView.frame.size.width * self.childControllers.count, _contentScrollView.frame.size.height);
    
    // ContentViewController setup
    for (int i = 0; i < self.childControllers.count; i++) {
        id obj = [self.childControllers objectAtIndex:i];
        if ([obj isKindOfClass:[UIViewController class]]) {
            UIViewController *controller = (UIViewController*)obj;
            CGFloat scrollWidth = _contentScrollView.frame.size.width;
            CGFloat scrollHeght = _contentScrollView.frame.size.height;
            controller.view.frame = CGRectMake(i * scrollWidth, 0, scrollWidth, scrollHeght);
            [_contentScrollView addSubview:controller.view];
        }
    }
    
    // meunView
    _menuView = [[MMMenuScroll alloc]initWithFrame:CGRectMake(0, header - kMMScrollMenuViewHeight - headerMargin , self.view.frame.size.width, kMMScrollMenuViewHeight)];
    _menuView.backgroundColor = [UIColor clearColor];
    _menuView.delegate = self;
    _menuView.viewbackgroudColor = self.menuBackGroudColor;
    _menuView.itemfont = self.menuItemFont;
    _menuView.itemTitleColor = self.menuItemTitleColor;
    _menuView.itemIndicatorColor = self.menuIndicatorColor;
    _menuView.scrollView.scrollsToTop = NO;
    [_menuView setItemTitleArray:self.titles];
//    [viewCover addSubview:_menuView];
    [self.view addSubview:_menuView];
//    _menuView.scrollView.contentInset = UIEdgeInsetsMake(0, self.view.center.x - CGRectGetWidth(((UILabel *)_menuView.itemViewArray[0]).frame), 0, 0.0);
    _menuView.scrollView.contentInset = UIEdgeInsetsMake(0, -headerScrollOffset, 0, 0.0);

    [self scrollMenuViewSelectedIndex:0];
    [self setNeedsStatusBarAppearanceUpdate];
    [self updateViewColor];
   }

-(void)setupHeader{
    // setupViews
    viewCover = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), header)];
    viewCover.backgroundColor = [UIColor redColor];
    
    JBKenBurnsView *kensBurnEffect = [[JBKenBurnsView alloc] initWithFrame:viewCover.frame];
    [kensBurnEffect animateWithImages:images transitionDuration:6 initialDelay:0 loop:YES isLandscape:YES];
    
    alphaBanner = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), header)];
//    alphaBanner.alpha = .5  ;
    alphaBanner.backgroundColor = [UIColor blackColor];
    
    navBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), topBarHeight + kMMScrollMenuViewHeight)];
    navBar.backgroundColor = [UIColor clearColor];
    
    navTitle = [[UILabel alloc]initWithFrame:CGRectMake(50, 27, 150, 21)];
    navTitle.textColor = [UIColor whiteColor];
    navTitle.text = @"Read Now";
    navTitle.alpha = 0;
    navTitle.font = [UIFont fontWithName:@"Roboto-Medium" size:20];


    UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
    menu.frame = CGRectMake(16, 27 , 20, 20);
    menu.tintColor = [UIColor whiteColor ];
    [menu setImage:[[UIImage imageNamed:@"menu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    
    
    UIButton *search = [UIButton buttonWithType:UIButtonTypeCustom];
    search.tintColor = [UIColor whiteColor ];
    search.frame = CGRectMake(self.view.frame.size.width-40, 27 , 20, 20);
    [search setImage:[[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];

    [navBar addSubview:menu];
    [navBar addSubview:search];
    [navBar addSubview:navTitle];
    
    [self.view addSubview:viewCover];
    [viewCover addSubview:kensBurnEffect];
    [viewCover addSubview:alphaBanner];
    [self.view addSubview:navBar];
    

}

#pragma mark Status Bar
-(BOOL)prefersStatusBarHidden{
    return showStatus;
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
#pragma mark -- private

- (void)setChildViewControllerWithCurrentIndex:(NSInteger)currentIndex
{
    for (int i = 0; i < self.childControllers.count; i++) {
        id obj = self.childControllers[i];
        if ([obj isKindOfClass:[UIViewController class]]) {
            UIViewController *controller = (UIViewController*)obj;
            if (i == currentIndex) {
                [controller willMoveToParentViewController:self];
                [self addChildViewController:controller];
                [controller didMoveToParentViewController:self];
            } else {
                [controller willMoveToParentViewController:self];
                [controller removeFromParentViewController];
                [controller didMoveToParentViewController:self];
            }
        }
    }
}
#pragma mark -- ScrollMenuView Delegate

- (void)scrollMenuViewSelectedIndex:(NSInteger)index
{
    [_contentScrollView setContentOffset:CGPointMake(index * _contentScrollView.frame.size.width, 0.) animated:YES];
    
//    // item color
//    [_menuView setItemTextColor:self.menuItemTitleColor
//           seletedItemTextColor:self.menuItemSelectedTitleColor
//                   currentIndex:index];
   
    [self setChildViewControllerWithCurrentIndex:index];
    
    if (index == self.currentIndex) { return; }
    self.currentIndex = index;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(containerViewItemIndex:currentController:)]) {
        [self.delegate containerViewItemIndex:self.currentIndex currentController:_childControllers[self.currentIndex]];
    }
    
     [self updateViewColor];
}

#pragma mark -- ScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat oldPointX = self.currentIndex * scrollView.frame.size.width;
    CGFloat ratio = (scrollView.contentOffset.x - oldPointX) / scrollView.frame.size.width;
    
    BOOL isToNextItem = (_contentScrollView.contentOffset.x > oldPointX);
    NSInteger targetIndex = (isToNextItem) ? self.currentIndex + 1 : self.currentIndex - 1;
    
    CGFloat nextItemOffsetX = 1.0f;
    CGFloat currentItemOffsetX = 1.0f;
    
    nextItemOffsetX = (_menuView.scrollView.contentSize.width - _menuView.scrollView.frame.size.width) * targetIndex / (_menuView.itemViewArray.count - 1);
    currentItemOffsetX = (_menuView.scrollView.contentSize.width - _menuView.scrollView.frame.size.width) * self.currentIndex / (_menuView.itemViewArray.count - 1);
    
    if (targetIndex >= 0 && targetIndex < self.childControllers.count) {
        // MenuView Move
        CGFloat indicatorUpdateRatio = ratio;
        if (isToNextItem) {
            
            CGPoint offset = _menuView.scrollView.contentOffset;
            offset.x = (nextItemOffsetX - headerScrollOffset - currentItemOffsetX) * ratio + currentItemOffsetX;
//            [_menuView.scrollView setContentOffset:offset animated:NO];
            indicatorUpdateRatio = indicatorUpdateRatio * 1;
//            [_menuView setIndicatorViewFrameWithRatio:indicatorUpdateRatio isNextItem:isToNextItem toIndex:self.currentIndex];
        } else {
            
            CGPoint offset = _menuView.scrollView.contentOffset;
            offset.x = currentItemOffsetX - (nextItemOffsetX - currentItemOffsetX) * ratio;
//            [_menuView.scrollView setContentOffset:offset animated:NO];
            indicatorUpdateRatio = indicatorUpdateRatio * -1;
//            [_menuView setIndicatorViewFrameWithRatio:indicatorUpdateRatio isNextItem:isToNextItem toIndex:targetIndex];
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int currentIndex = scrollView.contentOffset.x / _contentScrollView.frame.size.width;
    
    if (currentIndex == self.currentIndex) { return; }
    self.currentIndex = currentIndex;
    
    // item color
//    [_menuView setItemTextColor:self.menuItemTitleColor
//           seletedItemTextColor:self.menuItemSelectedTitleColor
//                   currentIndex:currentIndex];

  

     [_menuView updateIndicator:self.currentIndex];
    [self updateViewColor];
    if (self.delegate && [self.delegate respondsToSelector:@selector(containerViewItemIndex:currentController:)]) {
        [self.delegate containerViewItemIndex:self.currentIndex currentController:_childControllers[self.currentIndex]];
    }
    [self setChildViewControllerWithCurrentIndex:self.currentIndex];
}



#pragma mark Scroll Header

-(void)scrollTheHeader:(CGPoint)contentOffset{
//    NSLog(@"%f",contentOffset.y);
    
    //  ------------ Label
    CATransform3D headerTransform = CATransform3DIdentity;
    CATransform3D navTransform = CATransform3DIdentity;
    CATransform3D menuTransform = CATransform3DIdentity;
    
    //Header Transform
    if(contentOffset.y > 0){
        headerTransform = CATransform3DMakeTranslation(0, -MAX(contentOffset.y, 0), 0);
        viewCover.layer.transform = headerTransform;
        menuTransform = CATransform3DMakeTranslation(0, -MAX(contentOffset.y, 0), 0);
        _menuView.layer.transform = headerTransform;

//        _menuView.layer.zPosition = 0;
        
    }

        // ContentViewController setup
        for (int i = 0; i < self.childControllers.count; i++) {
            
            if(i != self.currentIndex){
                id obj = [self.childControllers objectAtIndex:i];
                if ([obj isKindOfClass:[UIViewController class]]) {
                    UIViewController *controller = (UIViewController*)obj;
                    for(UIView * subView in controller.view.subviews ) // here write Name of you ScrollView.
                    {
                        // Here You can Get all subViews of your UIScrollView.
                        
                        if([subView isKindOfClass:[UIScrollView class]]) // Check is SubView Class Is UIScrollView class?
                        {
                            // You can write code here for your UIScrollView;
                            ((UIScrollView *)subView).contentOffset = CGPointMake(0, contentOffset.y);
                        }
                    }
                    
                }
            }

        }
    
    //Nav bar transform
    if(contentOffset.y > header - (kMMScrollMenuViewHeight + topBarHeight + headerMargin)){
        NSLog(@"%f",contentOffset.y);
       
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
        navTransform = CATransform3DTranslate(navTransform, 0, -contentOffset.y + (header - (kMMScrollMenuViewHeight + topBarHeight + headerMargin)), 0);
        navBar.layer.transform = navTransform;
        
        
        
    }else{
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        [UIView animateWithDuration:.5 animations:^{
            
            navBar.backgroundColor = [UIColor clearColor];
            _menuView.itemIndicatorColor = [UIColor colorWithHexString:currentColor];
        }];
       
        navBar.layer.transform = CATransform3DIdentity;
    }
    
    //MenunTransform
    if(contentOffset.y > header){
        [_menuView.scrollView setContentOffset:CGPointMake(0, _menuView.scrollView.contentOffset.y) animated:NO];
        
        [UIView animateWithDuration:.4 animations:^{
            navBar.backgroundColor = [UIColor colorWithHexString:currentColor];
            _menuView.itemIndicatorColor = [UIColor whiteColor];
            navTitle.alpha = 1;
            
        }];
        
    }else if(contentOffset.y < kMMScrollMenuViewHeight/2){
        NSLog(@"DO");
        
        [UIView animateWithDuration:.4 animations:^{
            navBar.backgroundColor = [UIColor clearColor];
            _menuView.backgroundColor = [UIColor clearColor];
            navTitle.alpha = 0;
        }];

        [UIView animateWithDuration:.5 animations:^{
            [_menuView.scrollView setContentOffset:CGPointMake(headerScrollOffset, _menuView.scrollView.contentOffset.y) animated:NO];

        }];
    }
}

#pragma mark update color

-(void)updateViewColor{
    currentColor = _itemViewColorArray[self.currentIndex];
    if(navBar.backgroundColor != [UIColor clearColor]){
        _menuView.itemIndicatorColor = [UIColor whiteColor];
        [UIView animateWithDuration:.4 animations:^{
           
            navBar.backgroundColor = [UIColor colorWithHexString:currentColor];
           
 
        }];

    }else{
        _menuView.itemIndicatorColor = [UIColor colorWithHexString:currentColor];
    }
    
    [UIView animateWithDuration:.7 animations:^{
        alphaBanner.alpha = 1;
        [alphaBanner mdInflateAnimatedFromPoint:CGPointMake(alphaBanner.center.x , alphaBanner.center.y) backgroundColor:[UIColor colorWithHexString:currentColor] duration:.6 completion:nil];
        alphaBanner.alpha = 0.5;
        
    } completion:^(BOOL finished) {
        
 
    }];

    
}
@end

