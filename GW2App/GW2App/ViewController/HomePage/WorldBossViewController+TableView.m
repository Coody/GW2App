//
//  WorldBossViewController+TableView.m
//  GW2App
//
//  Created by min_liu on 2018/1/22.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WorldBossViewController+TableView.h"

// for view
#import "TableViewCell.h"

// for Constant
#import "Constants.h"
#import "GW2BroH_Tools.h"
static NSString *const cellIdentifier = @"cellIdentifier";

@implementation WorldBossViewController (TableView)

typedef enum : int{
    EnumBossIndex_1 = 0,
    EnumBossIndex_2 = 1,
    EnumBossIndex_3 = 2,
    EnumBossIndex_4 = 3,
    EnumBossIndex_5 = 4,
    EnumBossIndex_6 = 5,
    EnumBossIndex_7 = 6,
    EnumBossIndex_8 = 7,
    EnumBossIndex_9 = 8,
}EnumBossIndex;

-(void)cofigureTableview
{
    self.table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.table.backgroundColor = VC_OTHERS_BACKGROUND_COLOR;
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

    TableViewCell *cell = (TableViewCell*)[self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    
    /* 給定識別儲存格不在,會以識別子建立儲存格 */
    if(cell == nil) {

        /* 使用特製cell */
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
       
    }
    
    [cell setupCellWithBgImage:[self getCellImageWithIndex:indexPath.row]
                 withBossImage:[self getCellBossImageWithIndex:indexPath.row]
                     withTitle:[self getCellBossLabelWithIndex:indexPath.row]];


    return cell;
}

/* 每個區段多少資料 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;//self.content.count;
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
}

/* viewcell 視圖底部 */
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return self.tabBarController.tabBar.frame.size.height + 10.0f;
}

/* 取得BackgroundColor */
-(UIImage *)getCellImageWithIndex:(NSUInteger)index{
    if( self.blueBgImage == nil ){
        self.blueBgImage = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_blue"];
    }
    
    UIImage *tempBg = self.blueBgImage;
    if(index <= 0){
        
        if( self.redBgImage == nil ){
            self.redBgImage = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Red"];
        }

        tempBg = self.redBgImage;
    }
    else{
        tempBg = self.blueBgImage;
    }
    return tempBg;
}

/* 取得BossImage */
-(UIImage *)getCellBossImageWithIndex:(NSUInteger)index{
    
    UIImage *boss = nil;
    
    switch (index) {
        case EnumBossIndex_1:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"teq"];
            break;
        case EnumBossIndex_2:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"jungleWurm"];
            break;
        case EnumBossIndex_3:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"modniirUlgoth"];
            break;
        case EnumBossIndex_4:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"clawOfJormag"];
            break;
        case EnumBossIndex_5:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"svanirShaman"];
            break;
        case EnumBossIndex_6:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"golemMarkII"];
            break;
        case EnumBossIndex_7:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"evolvedJungleWurm"];
            break;
        case EnumBossIndex_8:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"theShatterer"];
            break;
        case EnumBossIndex_9:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"shadowBehemoth"];
            break;
        default:
            break;
    }
    return boss;
}

/* 取得BossTitle */
-(NSString *)getCellBossLabelWithIndex:(NSUInteger)index{
    
    UILabel *myLabel = [[UILabel alloc] init];
    
    switch (index) {
        case EnumBossIndex_1:
            myLabel.text = @"屍龍";
            break;
        case EnumBossIndex_2:
            myLabel.text = @"蟲王";
            break;
        case EnumBossIndex_3:
            myLabel.text = @"人馬王";
            break;
        case EnumBossIndex_4:
            myLabel.text = @"冰龍";
            break;
        case EnumBossIndex_5:
            myLabel.text = @"冰薩滿";
            break;
        case EnumBossIndex_6:
            myLabel.text = @"高倫王";
            break;
        case EnumBossIndex_7:
            myLabel.text = @"三蟲王";
            break;
        case EnumBossIndex_8:
            myLabel.text = @"水晶龍";
            break;
        case EnumBossIndex_9:
            myLabel.text = @"沼澤王";
            break;
        default:
            break;
    }
    return myLabel.text;
}
@end
