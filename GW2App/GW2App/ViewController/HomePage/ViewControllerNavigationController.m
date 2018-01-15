//
//  ViewControllerNavigationController.m
//  GW2App
//
//  Created by min_liu on 2018/1/12.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ViewControllerNavigationController.h"
#import "MainViewController.h"

@interface ViewControllerNavigationController () <UINavigationControllerDelegate>

@end

@implementation ViewControllerNavigationController

-(instancetype)init{
    self = [super init];
    if( self ){
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self setNavigationBarHidden:1 animated:NO];

}

//使用NavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

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
