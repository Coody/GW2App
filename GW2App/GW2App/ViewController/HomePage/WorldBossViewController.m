//
//  WorldBossViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/18.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WorldBossViewController.h"
#import "WorldBossViewController+TableView.h"
#import "ViewControllerNavigationController.h"
#import "WorldBossViewController+Data.h"
#import "ViewControllerTabBar.h"

// for Constant
#import "Constants.h"

//#import "TableViewCell.h"
#import "WorldBossTableViewCell.h"

// for Tools
#import "GW2BroH_Tools.h"


@interface WorldBossViewController ()
@end

@implementation WorldBossViewController

-(instancetype)init{
    self = [super init];
    if( self ){
        
        [self.view setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        [self cofigureTableview];
        [(ViewControllerNavigationController*) self.navigationController setNavigationBarTiteleUse: EnumTabBarIndexWorldBoss];
        /* 取得資料 */
        self.contentArray = [self getWorldBossPlist];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

-(void)setContent:(NSArray *)content{
    _contentArray = content;
    [self.worldBossTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
