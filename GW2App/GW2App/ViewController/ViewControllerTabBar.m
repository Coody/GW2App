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
#import "TabBar_3ViewController.h"
#import "TabBar_4ViewController.h"
#import "TabBar_5ViewController.h"
#import "LoginViewController.h"
#import "ViewControllerNavigationController.h"

// for constants
#import "Constants.h"
#import "GW2BroH_Tools.h"

@interface ViewControllerTabBar ()
{
    int indexShow;
}

//@property (nonatomic, strong) TabBar_1ViewController *vc1;
//@property (nonatomic, strong) TabBar_2ViewController *vc2;
//@property (nonatomic, strong) TabBar_2ViewController *vc3;
//@property (nonatomic, strong) TabBar_2ViewController *vc4;
//@property (nonatomic, strong) TabBar_2ViewController *vc5;

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
    indexShow = 0;
    
    // Do any additional setup after loading the view from its nib.
    
    /* Array2 */
    /* 將viewController做成實體 並使用Navigation控制*/
    TabBar_1ViewController *ViewController1 = [[TabBar_1ViewController alloc] init];
    ViewControllerNavigationController *vc1 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController1];
    
    TabBar_2ViewController *ViewController2 = [[TabBar_2ViewController alloc] init];
    ViewControllerNavigationController *vc2 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController2];
    
    TabBar_3ViewController *ViewController3 = [[TabBar_3ViewController alloc] init];
    ViewControllerNavigationController *vc3 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController3];
    
    TabBar_4ViewController *ViewController4 = [[TabBar_4ViewController alloc] init];
    ViewControllerNavigationController *vc4 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController4];
    
    TabBar_5ViewController *ViewController5 = [[TabBar_5ViewController alloc] init];
    ViewControllerNavigationController *vc5 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController5];

    _secondArray = [[NSArray alloc]initWithObjects: vc1, vc2, vc3, vc4, vc5, nil];
    
    /* Array1 */
    MainViewController *mainVC = [[MainViewController alloc] init];
    _firstArray = [[NSArray alloc] initWithObjects:[[ViewControllerNavigationController alloc] initWithFirstViewcontroller:mainVC], nil];
    [self.tabBar setHidden:YES];
    [self setViewControllers:_firstArray animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeViewControllerWithIndex:(EnumTabBarIndex)index{
    switch (index) {
        case EnumTabBarIndexWorldBoss:
        case EnumTabBarIndexDungeons:
        case EnumTabBarIndexMore:
        case EnumTabBarIndexGuild:
        case EnumTabBarIndexItems:
        {
            self.viewControllers = _secondArray;
            
            index = index - EnumTabBarIndexWorldBoss;
            
            [self.tabBar setHidden:NO];
            
            self.tabBar.backgroundColor  = VC_START_MENU_BACKGROUND_COLOR;
        }
            break;
        
        case EnumTabBarIndexStartMenu:
        {
            self.viewControllers = _firstArray;
            
            [self.tabBar setHidden:YES];
        }
        
        {
            NSLog(@"Select wrong index (%d) !!" , index);
        }
            break;
    }
    self.tabBar.tintColor = VC_START_MENU_BACKGROUND_COLOR;
    /* 換完陣列切換陣列內值 */
    self.selectedIndex = index;
    
}


-(int)getTabBarIndex{
    
    return indexShow;
}
@end
