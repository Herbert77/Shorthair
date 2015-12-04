//
//  RankingsViewController.m
//  Shorthair
//
//  Created by Herbert Hu on 15/12/2.
//  Copyright © 2015年 Herbert Hu. All rights reserved.
//

#import "RankingsViewController.h"
#import "RankingsCell.h"

#define kRankingsCellIdentifier @"RankingsCell"

@interface RankingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *contentTableView;

@end

@implementation RankingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _contentTableView.rowHeight = 65;
    [_contentTableView registerNib:[UINib nibWithNibName:@"RankingsCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:kRankingsCellIdentifier];
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RankingsCell *cell = (RankingsCell *)[tableView dequeueReusableCellWithIdentifier:kRankingsCellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell forRowAtIndexPath:indexPath];
    
    return cell;
}

- (void)configureCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



@end
