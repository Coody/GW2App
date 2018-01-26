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
        
        /* NavigationBar color */
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.navigationBar.frame.size.width, self.navigationBar.frame.size.height)];
        view.backgroundColor = VC_NAVIGATION_BAR_COLOR;
        [self.navigationBar setValue:view forKey:@"backgroundView"];

        /* 改变UINavigationBar导航条标题颜色和字体 */
        [viewController.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                   [UIColor whiteColor],NSForegroundColorAttributeName,
                                                                                   [UIFont fontWithName:D_Default_Font_Name size:26.0f ],
                                                                                   NSFontAttributeName,
                                                                                   nil]];

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* 顯示title */
-(void) setNavigationBarTiteleUse:(EnumTabBarIndex) index{
    
    /* TabBarItem item */
    index -= 10;
    NSArray *titleNavBar = @[@"世界王",@"Gem & 物品",@"副本 & 影片",@"公會相關",@"其他"];
    self.title = titleNavBar[index];
    UILabel *dyBoldLabel = [UILabel new];
    dyBoldLabel.font = [UIFont boldSystemFontOfSize:26];
    dyBoldLabel.text = titleNavBar[index];
    dyBoldLabel.frame = CGRectMake(0, 0, 300, 40);
    dyBoldLabel.textColor = [UIColor whiteColor];
    dyBoldLabel.textAlignment = NSTextAlignmentCenter;
    /* 设置阴影颜色 */
    [dyBoldLabel setShadowColor:[UIColor blackColor]];
    /* 设置阴影偏移量 */
    [dyBoldLabel setShadowOffset:CGSizeMake(2, 2)];
    /* 阴影透明度，默认0 */
    dyBoldLabel.layer.shadowOpacity = 0.3;
    /* 阴影半径，默认3 */
    dyBoldLabel.layer.shadowRadius = 3;
    [self.navigationBar addSubview:dyBoldLabel];
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
