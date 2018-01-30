//
//  WorldBossViewController+TableView.m
//  GW2App
//
//  Created by min_liu on 2018/1/22.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WorldBossViewController+TableView.h"

// for view
//#import "TableViewCell.h"
#import "WorldBossTableViewCell.h"
// for Constant
#import "Constants.h"
#import "GW2BroH_Tools.h"

static NSString *const cellIdentifier = @"cellIdentifier";

@implementation WorldBossViewController (TableView)
/* 初始化 */
-(void)cofigureTableview
{
    self.worldBossTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - self.tabBarController.tabBar.frame.size.height - 65)];
    self.worldBossTableView.backgroundColor = [UIColor clearColor];
    /* cell無線條 */
    self.worldBossTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.worldBossTableView.delegate = self;
    self.worldBossTableView.dataSource = self;
    
    [self.view addSubview:self.worldBossTableView];
}

/* TableViewDataSource */
/* 將資料填入TabView */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    WorldBossTableViewCell *cell = (WorldBossTableViewCell*)[self.worldBossTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    /* 給定識別儲存格不在,會以識別子建立儲存格 */
    if(cell == nil) {
        /* 使用特製cell */
        cell = [[WorldBossTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
       
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
    WorldBossModel *model = [self.contentArray objectAtIndex:indexPath.row];
    
    if ( model.isSelected == YES ) {
        return kWorldBossTableViewCellSelectedHight;
    }
    else{
        return kWorldBossTableViewCellHight;
    }
}

/* TableViewDelegate */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    /* 清除被按下的色塊區域顏色 */
    [tableView beginUpdates];
    
    if( self.selectedIndex == indexPath.row ){
        /* 資料 */
        WorldBossModel *model = [self.contentArray objectAtIndex:indexPath.row];
        /* tableview */
        WorldBossTableViewCell *cell = [self.worldBossTableView cellForRowAtIndexPath:indexPath];
        
        if( model.isSelected == YES ){
            model.isSelected = NO;
        }
        else{
            model.isSelected = YES;
        }
        
        cell.isSelected = model.isSelected;
    }
    else{
        /* 記錄目前選中的cell */
        WorldBossModel *model = [self.contentArray objectAtIndex:indexPath.row];
        WorldBossTableViewCell *cell = [self.worldBossTableView cellForRowAtIndexPath:indexPath];
        
        /* 前次選中的cell */
        WorldBossModel *selectedModel = [self.contentArray objectAtIndex:self.selectedIndex];
        WorldBossTableViewCell *selectedCell =  [self.worldBossTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectedIndex inSection:0]];;
        
        /* 取消前次的選取 */
        selectedModel.isSelected = NO;
        /* 目前的選取 */
        model.isSelected = YES;
        
        cell.isSelected = model.isSelected;
        selectedCell.isSelected = selectedModel.isSelected;
    }
    self.selectedIndex = indexPath.row;
    [tableView endUpdates];
    
    [self.worldBossTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}

@end
