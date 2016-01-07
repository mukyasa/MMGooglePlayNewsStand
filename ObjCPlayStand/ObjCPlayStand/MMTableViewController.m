//
//  MMTableViewController.m
//  ObjCPlayStand
//
//  Created by Mukesh on 05/01/16.
//  Copyright © 2016 Mad Apps. All rights reserved.
//

#import "MMTableViewController.h"
#import "PlayListTableViewCell.h"
#import "UIColor+HexRepresentation.h"
@interface MMTableViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray * datasource;
}
@end

@implementation MMTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    datasource = @[@"ONE",@"TWO",@"THREE",@"FOUR",@"FIVE",@"SIX",@"SEVEN",@"EIGHT",@"NINE",@"TEN",@"ONE",@"ONE",@"TWO",@"THREE",@"FOUR",@"FIVE",@"SIX",@"SEVEN",@"EIGHT",@"NINE",@"TEN",@"ONE"];
    self.view.backgroundColor = [UIColor clearColor];
    datasource = @[@"ironman.jpg",@"worldbg.jpg",@"sportsbg.jpg",@"applebg.png",@"businessbg.jpg"];
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    UIView *clearView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
    clearView.backgroundColor = [UIColor clearColor];
    
    UIImageView *logo = [[UIImageView alloc] initWithFrame:CGRectMake(clearView.center.x - 30, clearView.center.y - 30, 60, 60)];
    logo.backgroundColor = [UIColor colorWithHexString:self.logoColor];
    logo.image = [[UIImage imageNamed:self.logoImage] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];

    logo.contentMode = UIViewContentModeCenter;
    logo.layer.cornerRadius = logo.frame.size.width/2;
    logo.tintColor = [UIColor whiteColor];
    [clearView addSubview:logo];
    
    
    _tableView.tableHeaderView = clearView;
    [self.tableView registerNib:[UINib nibWithNibName:@"PlayListTableViewCell" bundle:nil] forCellReuseIdentifier:@"PlayListCell"];
    self.tableView.rowHeight = 314;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.decelerationRate =  UIScrollViewDecelerationRateFast;
    _tableView.alwaysBounceVertical = NO;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return datasource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *CellIdentifier = @"PlayListCell";
    PlayListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell==nil) {
        cell = [[PlayListTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        
    }
//    cell.backgroundColor = [UIColor colorWithHexString:@"e5e5ee5"];
//    cell.textLabel.text = datasource[indexPath.row];
//    cell.detailTextLabel.text = datasource[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.headerImage.image = [UIImage imageNamed:datasource[indexPath.row]];
    return cell;
}

@end
