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
        [self setNavigationBarHidden:NO animated:YES];
        
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
