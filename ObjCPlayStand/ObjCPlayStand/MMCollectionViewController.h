//
//  MMCollectionViewController.h
//  ObjCPlayStand
//
//  Created by Mukesh on 07/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
@interface MMCollectionViewController : BaseViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong , nonatomic) UICollectionView *collectionView;

@end
