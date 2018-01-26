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

// for TabBar
#import "ViewControllerTabBar.h"
// for Constant
#import "Constants.h"

// for Tools
#import "GW2BroH_Tools.h"


@interface WorldBossViewController ()


@end

@implementation WorldBossViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [(ViewControllerNavigationController*) self.navigationController setNavigationBarTiteleUse: EnumTabBarIndexWorldBoss];
    
    /* ViewCell */
    self.content = @[ @"1", @"2", @"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    [self cofigureTableview];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
