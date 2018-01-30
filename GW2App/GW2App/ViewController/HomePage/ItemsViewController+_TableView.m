//
//  ItemsViewController+_TableView.m
//  GW2App
//
//  Created by min_liu on 2018/1/29.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ItemsViewController+_TableView.h"

// for view
//#import "TableViewCell.h"
#import "WorldBossTableViewCell.h"
// for Constant
#import "Constants.h"
#import "GW2BroH_Tools.h"
static NSString *const cellIdentifier = @"cellItem";

@implementation ItemsViewController (_TableView)


typedef enum : int{
    EnumItemIndex_1 = 0,
    EnumItemIndex_2 = 1,

}EnumBossIndex;

-(void)cofigureTableview
{
    self.table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.table.backgroundColor = [UIColor clearColor];
    /* cell無線條 */
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.table.delegate = self;
    self.table.dataSource = self;
    //self.table.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.table];
    

}

/* TableViewDataSource */
/* 將資料填入TabView */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WorldBossTableViewCell *cell = (WorldBossTableViewCell*)[self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    
    /* 給定識別儲存格不在,會以識別子建立儲存格 */
    if(cell == nil) {
        
        /* 使用特製cell */
        cell = [[WorldBossTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    
//    [cell setupItemsCellWithBgImage:[self getCellImageWithIndex:indexPath.row]
//                     withTitle:[self getCellBossLabelWithIndex:indexPath.row]];
    
    
    return cell;
}

/* 每個區段多少資料 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
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

/* 取得BackgroundColor */
-(UIImage *)getCellImageWithIndex:(NSUInteger)index{
    if( self.blueBgImage == nil ){
        self.blueBgImage = [GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"goldCell"];
    }
    
    UIImage *tempBg = self.blueBgImage;
    if(index <= 0){
        
        if( self.redBgImage == nil ){
            self.redBgImage = [GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"gemCell"];
        }
        
        tempBg = self.redBgImage;
    }
    else{
        tempBg = self.blueBgImage;
    }
    return tempBg;
}

/* 取得BossTitle */
-(NSString *)getCellBossLabelWithIndex:(NSUInteger)index{
    
    UILabel *myLabel = [[UILabel alloc] init];
    
    switch (index) {
        case EnumItemIndex_1:
            myLabel.text = @"屍龍";
            break;
        case EnumItemIndex_2:
            myLabel.text = @"蟲王";
            break;
        default:
            break;
    }
    return myLabel.text;
}


@end
