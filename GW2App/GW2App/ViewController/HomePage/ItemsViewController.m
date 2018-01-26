//
//  ItemsViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/18.
//  Copyright © 2018年 min_liu. All rights reserved.
//
#import "Constants.h"
#import "GW2BroH_Tools.h"
#import "ItemsViewController.h"
#import "ViewControllerTabBar.h"
//Navigationtitle
#import "ViewControllerNavigationController.h"
@interface ItemsViewController ()

@end

@implementation ItemsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = VC_START_MENU_BACKGROUND_COLOR;
    /* 顯示title */
    [(ViewControllerNavigationController*) self.navigationController setNavigationBarTiteleUse: EnumTabBarIndexItems];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
    button.center = self.view.center;
    [button setTitle:@"test" forState:(UIControlStateNormal)];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(pressedBtn:) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pressedBtn:(id)sender{
    [(ViewControllerTabBar *)self.tabBarController changeViewControllerWithIndex:EnumTabBarIndexStartMenu];
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
