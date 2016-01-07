//
//  MMCollectionViewController.m
//  ObjCPlayStand
//
//  Created by Mukesh on 07/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "MMCollectionViewController.h"
#import "PlayListCollectionViewCell.h"
#import "UIColor+HexRepresentation.h"
@interface MMCollectionViewController (){
    NSArray *datasource;
}

@end

@implementation MMCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    layout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.view.frame), 200);
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"PlayListCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
    [self.view addSubview:_collectionView];
    _collectionView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor clearColor];
    datasource = @[@"ironman.jpg",@"worldbg.jpg",@"sportsbg.jpg",@"applebg.png",@"businessbg.jpg",@"ironman.jpg",@"worldbg.jpg",@"sportsbg.jpg",@"applebg.png",@"businessbg.jpg",@"ironman.jpg",@"worldbg.jpg",@"sportsbg.jpg",@"applebg.png",@"businessbg.jpg",@"ironman.jpg",@"worldbg.jpg",@"sportsbg.jpg",@"applebg.png",@"businessbg.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return datasource.count;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PlayListCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor clearColor];
    cell.headerImage.image=[UIImage imageNamed:datasource[indexPath.row]];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        UICollectionReusableView *reusableview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (reusableview==nil) {
            reusableview=[[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
        }
        UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(reusableview.center.x - 30, reusableview.center.y - 30, 60, 60)];
        logo.backgroundColor = [UIColor colorWithHexString:self.logoColor];
        logo.image = [[UIImage imageNamed:self.logoImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        logo.contentMode = UIViewContentModeCenter;
        logo.layer.cornerRadius = logo.frame.size.width/2;
        logo.tintColor = [UIColor whiteColor];
        [reusableview addSubview:logo];
       
        return reusableview;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.frame)/3 - 10, CGRectGetWidth(self.view.frame)/3 - 10);
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
