//
//  ViewControllerTabBar.m
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//

#import "ViewControllerTabBar.h"


// for ViewController
#import "MainViewController.h"

#import "WorldBossViewController.h"
#import "ItemsViewController.h"
#import "DungeonsViewController.h"
#import "GuildViewController.h"
#import "MoreViewController.h"
#import "LoginViewController.h"

#import "ViewControllerNavigationController.h"
// for constants
#import "Constants.h"
#import "GW2BroH_Tools.h"

@interface ViewControllerTabBar ()


@property (nonatomic , strong) NSArray *firstArray;
@property (nonatomic , strong) NSArray *secondArray;

@end

@implementation ViewControllerTabBar


-(id)init{
    self = [super init];
    if ( self != nil ) {
//        self.tabBar.selectedItem 
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.tintColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view from its nib.
    
    /* Array2 */
    /* 將viewController做成實體 並使用Navigation控制*/

    WorldBossViewController *ViewController1 = [[WorldBossViewController alloc] init];
    ViewControllerNavigationController *vc1 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController1];
    
    ItemsViewController *ViewController2 = [[ItemsViewController alloc] init];
    ViewControllerNavigationController *vc2 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController2];
    
    DungeonsViewController *ViewController3 = [[DungeonsViewController alloc] init];
    ViewControllerNavigationController *vc3 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController3];
    
    GuildViewController *ViewController4 = [[GuildViewController alloc] init];
    ViewControllerNavigationController *vc4 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController4];
    
    MoreViewController *ViewController5 = [[MoreViewController alloc] init];
    ViewControllerNavigationController *vc5 = [[ViewControllerNavigationController alloc] initWithFirstViewcontroller:ViewController5];

    _secondArray = [[NSArray alloc]initWithObjects: vc1, vc2, vc3, vc4, vc5, nil];


    /* Array1 */
    MainViewController *mainVC = [[MainViewController alloc] init];
    _firstArray = [[NSArray alloc] initWithObjects:[[ViewControllerNavigationController alloc] initWithFirstViewcontroller:mainVC], nil];
    
    /* 開啟切到陣列1顯示主畫面 */
    [self.tabBar setHidden:YES];
    [self setViewControllers:_firstArray animated:YES];
    
    
    /* TabBar Icon */
    vc1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"世界王" image:[GW2BroH_Tools getImageWithString:@"NavigationControllerWorldBoss" withImageName:@"Boss"] tag:0];
    
    vc2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"拍賣場" image:[GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"tp"] tag:1];
    
    vc3.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"副本" image:[GW2BroH_Tools getImageWithString:@"ViewControllerDungeons" withImageName:@"dungeon"] tag:2];
    
    vc4.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"公會" image:[GW2BroH_Tools getImageWithString:@"ViewControllerGuild" withImageName:@"Bounty"] tag:3];
    
    vc5.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag: 4];
    
    
    [self setTabbar:vc1.tabBarItem];
    [self setTabbar:vc2.tabBarItem];
    [self setTabbar:vc3.tabBarItem];
    [self setTabbar:vc4.tabBarItem];
    [self setTabbar:vc5.tabBarItem];
    
//    [vc3.tabBar setBarTintColor:[UIColor whiteColor];
//    [vc3.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAutomatic];
//    [vc4.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [vc5.tabBarItem.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
}
/* 設定TabBar資料 */
-(void)setTabbar:(UITabBarItem *)tabbarItem{
    
    /* TabBar顯示文字顏色文字大小 未選中 */
    [tabbarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                            [UIColor grayColor], NSForegroundColorAttributeName,
                                            [UIFont fontWithName:D_Default_Font_Name size:12.0f],NSFontAttributeName,
                                            nil] forState:UIControlStateNormal];
    /* TabBar顯示文字顏色文字大小 選中 */
    [tabbarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                                       [UIFont fontWithName:D_Default_Font_Name size:12.0f],NSFontAttributeName,
                                                       nil] forState:UIControlStateSelected];
    
    /* TabBar顯示未選中 Icon */
    [self.tabBar setUnselectedItemTintColor:[UIColor grayColor]];
    
    /* TabBar顯示選中 Icon */ //????
//    [self.tabBar setBarTintColor:[UIColor whiteColor]];
//    [self.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)hy_setBackgroundViewWithColor:(UIColor *)backgroundColor{
    
    self.tabBar.barStyle = UIBarStyleBlackOpaque;
    [self hy_setBackgroundViewSubViewAlpha:0];
    
    // 通过KVC拿到这个属性，然后对其进行直接赋值
    UIView *backgroundViewObject = [self.tabBar valueForKey:@"backgroundView"];
    // 设置其CALayer属性的颜色值，因为CALayer是通过GPU渲染的，所以性能高一些，又不影响CPU
    backgroundViewObject.layer.backgroundColor = backgroundColor.CGColor;
    
}

- (void)hy_setBackgroundViewWithAlpha:(CGFloat)alpha{
    
    // 通过KVC拿到这个属性，然后对其进行直接赋值
    UIView *backgroundViewObject = [self.tabBar valueForKey:@"backgroundView"];
    // 设置其CALayer属性的颜色值，因为CALayer是通过GPU渲染的，所以性能高一些，又不影响CPU
    backgroundViewObject.alpha = alpha;
    
}

-(void)hy_setBackgroundViewSubViewAlpha:(CGFloat)alpha{
    // 通过KVC拿到这个属性，然后对其子控件进行修改
    UIView *backgroundViewObject = [self.tabBar valueForKey:@"backgroundView"];
    for (UIView *childView in backgroundViewObject.subviews) {
        childView.alpha = alpha;
    }
}


/* 切換TabBar切換ViewController*/
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
            
            self.tabBar.backgroundColor  = VC_NAVIGATION_BAR_COLOR;
          
            [self hy_setBackgroundViewWithColor:VC_NAVIGATION_BAR_COLOR];
            [self hy_setBackgroundViewWithAlpha:0];
            
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

@end
