//
//  LoginViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/12.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "Constants.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

-(instancetype)init{
    self = [super init];
    if( self ){
        [self.view setFrame:[UIScreen mainScreen].bounds];
        
        
    }
    return self;
}


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
    
    //self.navigationBar.backgroundColor = VC_NAVIGATION_BAR_COLOR;
    self.title = @"Some Title";
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
