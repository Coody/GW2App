//
//  DungeonsViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/18.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "DungeonsViewController.h"
//Navigationtitle
#import "ViewControllerNavigationController.h"
//TabBar icon
#import "GW2BroH_Tools.h"
@interface DungeonsViewController ()

@end

@implementation DungeonsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /* 顯示title */
    [(ViewControllerNavigationController*) self.navigationController setNavigationBarTiteleUse: EnumTabBarIndexDungeons];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
