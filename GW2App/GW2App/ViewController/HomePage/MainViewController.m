//
//  MainViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/12.
//  Copyright © 2018年 min_liu. All rights reserved.
//
#import "Constants.h"
#import "MainViewController.h"
#import "TabBar_1ViewController.h"
#import "LoginViewController.h"

#import "TabBar_1ViewController.h"
#import "ViewControllerTabBar.h"
#import "ViewControllerNavigationController.h"

@interface MainViewController ()

@end

@implementation MainViewController


-(instancetype)init{
    self = [super init];
    if( self ){
        [self.view setFrame:[UIScreen mainScreen].bounds];
    }
    return self;
}


-(void) pushStart{

    [(ViewControllerTabBar *)self.tabBarController changeViewControllerWithIndex:EnumTabBarIndexWorldBoss];
}


-(void) pushLoing{
    
    LoginViewController *vc = [[LoginViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor orangeColor]];

    /* StartButton */
    UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [newBtn setFrame:CGRectMake(140, 200+70, 46, 30)];
    [newBtn setTitle:@"Start" forState:UIControlStateNormal];
    
    [newBtn addTarget:self action:@selector(pushStart) forControlEvents:UIControlEventTouchUpInside];
    [newBtn setBackgroundColor:[UIColor whiteColor]];
    newBtn.tintColor = [UIColor blueColor];
    [self.view addSubview:newBtn];
    
    /* LoginButton */
    UIButton *LoginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [LoginBtn setFrame:CGRectMake(140, 200, 46, 30)];
    [LoginBtn setTitle:@"Loing" forState:UIControlStateNormal];
    
    [LoginBtn addTarget:self action:@selector(pushLoing) forControlEvents:UIControlEventTouchUpInside];
    [LoginBtn setBackgroundColor:[UIColor whiteColor]];
    LoginBtn.tintColor = [UIColor blueColor];
    [self.view addSubview:LoginBtn];
    

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
