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

@interface ItemsViewController ()

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = VC_START_MENU_BACKGROUND_COLOR;
    //self.navigationBar.backgroundColor = VC_NAVIGATION_BAR_COLOR;
    
    self.title = @"拍賣場";
    
    /* 顯示label */
    UILabel *myLabel = [[UILabel alloc] init];
    CGRect labelFrame = CGRectMake(120.0f, 25.0f, 180.0f, 23.0f);
    myLabel  = [[UILabel alloc]initWithFrame:labelFrame];
    myLabel.text = @"page2";
    myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    [self.view addSubview:myLabel];
    
    UIImage *test = [GW2BroH_Tools getImageWithString:@"ViewControllerGuild" withImageName:@"bounty"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:test];
    imageview.center = CGPointMake(150, 300);
    [self.view addSubview:imageview];
    
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
