//
//  ItemsViewController+_TableView.m
//  GW2App
//
//  Created by min_liu on 2018/1/29.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ItemsViewController+_TableView.h"

// for view
#import "ItemsTableViewCell.h"
// for Constant
#import "Constants.h"
#import "GW2BroH_Tools.h"
static NSString *const cellIdentifier = @"cellItem";

@implementation ItemsViewController (_TableView)
/* 初始化 */
-(void)cofigureTableview
{
    self.ItemTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.tabBarController.tabBar.frame.size.height)];
    self.ItemTableView.backgroundColor = [UIColor clearColor];
    /* cell無線條 */
    self.ItemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.ItemTableView.delegate = self;
    self.ItemTableView.dataSource = self;
    
    [self.view addSubview:self.ItemTableView];
    
}

/* TableViewDataSource */
/* 將資料填入TabView */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    ItemsTableViewCell *cell = (ItemsTableViewCell*)[self.ItemTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    /* 給定識別儲存格不在,會以識別子建立儲存格 */
    if(cell == nil) {
        /* 使用特製cell */
        cell = [[ItemsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [cell setupCell:[self.contentArray objectAtIndex:indexPath.row]];
    return cell;
}

/* 每個區段多少資料 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contentArray.count;
}

/* 多少個區段資料 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

/* cell 高 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 114.0f;
}

/* TableViewDelegate */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    //NSLog(@"title of cell %@", [_content objectAtIndex:indexPath.row]);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /* 顯示系統時間 */
//    NSDate *currentDate = [NSDate date];
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
//    [formatter setDateStyle:NSDateFormatterShortStyle];
//    [formatter setTimeStyle:NSDateFormatterMediumStyle];
//    NSString *currentDateString = [formatter stringFromDate:currentDate];
//    NSLog(@"更新時間: %@", currentDateString);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *date = [NSDate date];
    //正規化的格式設定
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    //正規化取得的系統時間並顯示
    //dateLabel.text = [formatter stringFromDate:date];
    NSLog(@"更新時間: %@", [formatter stringFromDate:date]);
}

/* viewcell 視圖底部 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.tabBarController.tabBar.frame.size.height + 10.0f;
}


@end
