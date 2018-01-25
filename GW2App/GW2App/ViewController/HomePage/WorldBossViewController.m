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

//-(instancetype)init{
//    self = [super init];
//    if( self ){
//        UIImage *image = [GW2BroH_Tools getImageWithString:@"NavigationControllerWorldBoss" withImageName:@"Boss"];
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"世界王" image:image selectedImage:image];
//        item.tag = 1;
//        self.tabBarItem = item;
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /* ViewCell */
    self.content = @[ @"1", @"2", @"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    
    [self cofigureTableview];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
