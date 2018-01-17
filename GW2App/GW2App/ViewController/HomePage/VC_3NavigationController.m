//
//  VC_3NavigationController.m
//  GW2App
//
//  Created by min_liu on 2018/1/16.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "VC_3NavigationController.h"
#import "Constants.h"
@interface VC_3NavigationController ()

@end

@implementation VC_3NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = VC_START_MENU_BACKGROUND_COLOR;
    self.navigationBar.backgroundColor = VC_NAVIGATION_BAR_COLOR;
    
    /* 顯示label */
    UILabel *myLabel = [[UILabel alloc] init];
    CGRect labelFrame = CGRectMake(120.0f, 25.0f, 180.0f, 23.0f);
    myLabel  = [[UILabel alloc]initWithFrame:labelFrame];
    myLabel.text = @"page3";
    myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
    [self.view addSubview:myLabel];
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
