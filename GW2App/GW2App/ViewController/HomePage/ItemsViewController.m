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

#import "ItemsViewController+_TableView.h"
//Navigationtitle
#import "ViewControllerNavigationController.h"
@interface ItemsViewController ()

@end

@implementation ItemsViewController

-(instancetype)init{
    self = [super init];
    if( self ){
        
        [self.view setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        [self cofigureTableview];
        [(ViewControllerNavigationController*) self.navigationController setNavigationBarTiteleUse: EnumTabBarIndexItems];
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /* 顯示title */
    
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 30)];
//    button.center = self.view.center;
//    [button setTitle:@"test" forState:(UIControlStateNormal)];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(pressedBtn:) forControlEvents:(UIControlEventTouchUpInside)];
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
