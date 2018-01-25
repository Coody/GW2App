//
//  ViewControllerNavigationController.m
//  GW2App
//
//  Created by min_liu on 2018/1/12.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ViewControllerNavigationController.h"
#import "MainViewController.h"
#import "ViewControllerTabBar.h"

#import "WorldBossViewController.h"
#import "ItemsViewController.h"
#import "DungeonsViewController.h"
#import "GuildViewController.h"
#import "MoreViewController.h"

#import "Constants.h"
#import "GW2BroH_Tools.h"

@interface ViewControllerNavigationController () <UINavigationControllerDelegate>
/* 實體 */
@property (nonatomic , strong) UIViewController *vc;
@end

@implementation ViewControllerNavigationController

-(instancetype)initWithFirstViewcontroller:(UIViewController *)firstViewController;{
    self = [super init];
    if( self ){
        self.delegate = self;
        _vc = firstViewController;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* 顯示出ViewController */
    [self pushViewController:_vc animated:YES];
    
    
}

//使用NavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    /* 當時ViewControllr不是主畫面顯示NavigationBar */
    if([viewController isMemberOfClass:[MainViewController class]])
    {
        [self setNavigationBarHidden:YES animated:NO];
    }
    else
    {
        [self.navigationBar setTranslucent:NO];
        self.navigationBar.backgroundColor = VC_NAVIGATION_BAR_COLOR;
        [self setNavigationBarHidden:NO animated:YES];
        
        /* TabBarItem item */
        UIImage *image = nil;
        int iSel = 0;
        NSArray *ss = @[@"世界王",@"拍賣場",@"副本",@"公會",@"More"];
        
        //------------------------
//        UITabBarItem *item1 = nil;
//        UITabBarItem *item  = nil;
//        
//        //UITabBarItem *item = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMostRecent tag:1];
//        
//        
//        iSel = 0;
//        image = [GW2BroH_Tools getImageWithString:@"NavigationControllerWorldBoss" withImageName:@"Boss"];
//        //item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image selectedImage:image];
//        item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image tag:0];
//        self.tabBarItem = item1;
//        
//        iSel = 1;
//        image = [GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"tp"];
//        //item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image selectedImage:image];
//        item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image tag:1];
//        self.tabBarItem = item1;
//        iSel = 2;
//        image = [GW2BroH_Tools getImageWithString:@"ViewControllerDungeons" withImageName:@"dungeon"];
//        item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image tag:2];
//        //item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image selectedImage:image];
//        self.tabBarItem = item1;
//        iSel = 3;
//        image = [GW2BroH_Tools getImageWithString:@"ViewControllerGuild" withImageName:@"Bounty"];
//        //item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image selectedImage:image];
//        item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image tag:3];
//        self.tabBarItem = item1;
//        iSel = 4;
//        image = [GW2BroH_Tools getImageWithString:@"NavigationControllerWorldBoss" withImageName:@"Boss"];
//        //item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image selectedImage:image];
//        item1 = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image tag:4];
//        self.tabBarItem = item1;
//        
//    
//        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image selectedImage:image];
//        self.tabBarItem = item;
        //-------------------------
        if([viewController isMemberOfClass:[WorldBossViewController class]])
        {
            iSel = 0;
            image = [GW2BroH_Tools getImageWithString:@"NavigationControllerWorldBoss" withImageName:@"Boss"];
        }
        else
        if([viewController isMemberOfClass:[ItemsViewController class]])
        {
            iSel = 1;
            image = [GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"tp"];
        }
        else
        if([viewController isMemberOfClass:[DungeonsViewController class]])
        {
            iSel = 2;
            image = [GW2BroH_Tools getImageWithString:@"ViewControllerDungeons" withImageName:@"dungeon"];
        }
        else
        if([viewController isMemberOfClass:[GuildViewController class]])
        {
            iSel = 3;
            image = [GW2BroH_Tools getImageWithString:@"ViewControllerGuild" withImageName:@"Bounty"];
        }
        else
        if([viewController isMemberOfClass:[MoreViewController class]])
        {
            iSel = 4;
            image = [GW2BroH_Tools getImageWithString:@"NavigationControllerWorldBoss" withImageName:@"Boss"];
        }
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:ss[iSel] image:image selectedImage:image];
        self.tabBarItem = item;

    }
    
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
