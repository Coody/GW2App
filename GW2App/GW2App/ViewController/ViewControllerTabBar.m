//
//  ViewControllerTabBar.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//

#import "ViewControllerTabBar.h"


// for ViewController
#import "MainViewController.h"
#import "TabBar_1ViewController.h"
#import "TabBar_2ViewController.h"
#import "VC_3NavigationController.h"
#import "VC_4NavigationController.h"
#import "VC_5NavigationController.h"
#import "LoginViewController.h"
#import "ViewControllerNavigationController.h"

// for constants
#import "Constants.h"
#import "GW2BroH_Tools.h"

@interface ViewControllerTabBar () <UITabBarControllerDelegate>

//@property (nonatomic, strong) MainViewController *vcMain;
@property (nonatomic, strong) TabBar_1ViewController *vc1;
@property (nonatomic, strong) TabBar_2ViewController *vc2;
@property (nonatomic, strong) VC_3NavigationController *vc3;
@property (nonatomic, strong) VC_4NavigationController *vc4;
@property (nonatomic, strong) VC_5NavigationController *vc5;
//@property (nonatomic, strong) ViewControllerNavigationController *nvaColler;

@property (nonatomic, strong) LoginViewController *LoginVC;

@property (nonatomic , strong) NSArray *firstArray;
@property (nonatomic , strong) NSArray *secondArray;
@end

@implementation ViewControllerTabBar


-(id)init{
    self = [super init];
    if ( self != nil ) {
        //UIImage *test = [GW2BroH_Tools getImageWithString:@"/Datas/ViewControllerGuild" withImageName:@"bounty"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    /* Array2 */
    self.vc1 = [[TabBar_1ViewController alloc] initWithNibName:nil bundle:NULL];
    self.vc2 = [[TabBar_2ViewController alloc] initWithNibName:nil bundle:NULL];
    self.vc3 = [[VC_3NavigationController alloc] initWithNibName:nil bundle:NULL];
    self.vc4 = [[VC_4NavigationController alloc] initWithNibName:nil bundle:NULL];
    self.vc5 = [[VC_5NavigationController alloc] initWithNibName:nil bundle:NULL];
    _secondArray = [[NSArray alloc]initWithObjects:self.vc1,self.vc2,
                    self.vc3,self.vc4,self.vc5,nil];
    
    /* Array1 */
    //self.MainVC = [[MainViewController alloc] initWithNibName:nil bundle:NULL];
    //self.LoginVC = [[LoginViewController alloc] initWithNibName:nil bundle:NULL];
    
    _firstArray = [[NSArray alloc] initWithObjects:[[ViewControllerNavigationController alloc] init], nil];
    [self setViewControllers:_firstArray animated:YES];
    
    
//    UIImage *test = [GW2BroH_Tools getImageWithString:@"GW2App/Datas/ViewControllerGuild" withImageName:@"bounty@2x.png"];
//    
//    self.TabBar_1VC.tabBarItem.selectedImage = test;
//    self.TabBar_1VC.tabBarItem.image = test;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeViewControllerWithIndex:(NSUInteger)index{
    if( index == EnumTabBarIndexStartMenu)
    {
        
        self.viewControllers = _firstArray;
        self.selectedIndex = EnumTabBarIndexStartMenu;
    }
    else if( index == EnumTabBarIndexWorldBoss)
    {
        self.viewControllers = _secondArray;
        self.selectedIndex = EnumTabBarIndexWorldBoss;
    }
    else{
        
    }
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    
    if( selectedIndex == EnumTabBarIndexStartMenu)
    {
        super.selectedIndex = selectedIndex;
        [self.tabBar setHidden:YES];
    }
    else if( selectedIndex == EnumTabBarIndexWorldBoss)
    {
        /* 第一頁 */
        super.selectedIndex = selectedIndex - 10;
        
        [self.tabBar setHidden:NO];
        
        self.tabBar.backgroundColor  = VC_START_MENU_BACKGROUND_COLOR;
    }
    else{
        
    }
    self.tabBar.tintColor = VC_START_MENU_BACKGROUND_COLOR;
    NSLog(@" index = %lu " , (unsigned long)super.selectedIndex);
}

@end
