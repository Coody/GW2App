//
//  LoginViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/12.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "LoginViewController.h"
#import "Constants.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(void) popSurController{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(popSurController)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    self.view.backgroundColor = VC_START_MENU_BACKGROUND_COLOR;
    
    self.title = @"Login";
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
