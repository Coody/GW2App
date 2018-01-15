//
//  MainViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/12.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "MainViewController.h"
#import "TabBar_1ViewController.h"
#import "LoginViewController.h"

#import "TabBar_1ViewController.h"
#import "ViewControllerTabBar.h"
#import "ViewControllerNavigationController.h"


@interface MainViewController ()
@property (nonatomic, strong) TabBar_1ViewController *TabBar_1VC;

@end

@implementation MainViewController
@synthesize TabBar_1VC;

-(instancetype)init{
    self = [super init];
    if( self ){
        [self.view setFrame:[UIScreen mainScreen].bounds];
    }
    return self;
}



-(void) pushStart{

    [(ViewControllerTabBar *)self.tabBarController changeViewControllerWithIndex:TAB_BAR_CONTROLLER_GAIN];

}


-(void) pushLoing{
    
    ViewControllerNavigationController *NavCol = [[ViewControllerNavigationController alloc] init];
    
    [NavCol setNavigationBarHidden:NO animated:YES];
    
    LoginViewController *vc = [[LoginViewController alloc]init];
    //有前後頁關係顯示
    //[NavCol pushViewController:vc animated:YES];
    [self.navigationController pushViewController:vc animated:NO];
    //換新畫面
    //[self presentViewController:sc animated:1 completion:nil];
    
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
