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
#import "LoginViewController.h"

// for constants
#import "Constants.h"
#import "GW2BroH_Tools.h"

@interface ViewControllerTabBar () <UITabBarControllerDelegate>

@property (nonatomic, strong) MainViewController *MainVC;
@property (nonatomic, strong) TabBar_1ViewController *TabBar_1VC;
@property (nonatomic, strong) TabBar_2ViewController *TabBar_2VC;
@property (nonatomic, strong) LoginViewController *LoginVC;

@property (nonatomic , strong) NSArray *firstArray, *triArray;
@property (nonatomic , strong) NSArray *secondArray;
@end

@implementation ViewControllerTabBar
@synthesize TabBar_1VC,TabBar_2VC,MainVC;

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
    self.TabBar_1VC = [[TabBar_1ViewController alloc] initWithNibName:nil bundle:NULL];
    self.TabBar_2VC = [[TabBar_2ViewController alloc] initWithNibName:nil bundle:NULL];
    _secondArray = [[NSArray alloc]initWithObjects:self.TabBar_1VC,self.TabBar_2VC,nil];
    
    /* Array1 */
    self.MainVC = [[MainViewController alloc] initWithNibName:nil bundle:NULL];
    _firstArray = [[NSArray alloc]initWithObjects:self.MainVC,nil];
    
    [self setViewControllers:_firstArray animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)changeViewControllerWithIndex:(NSUInteger)index{
    if( index == TAB_BAR_CONTROLLER_MAIN)
    {
        
        self.viewControllers = _firstArray;
        self.selectedIndex = TAB_BAR_CONTROLLER_MAIN;
    }
    else if( index == TAB_BAR_CONTROLLER_GAIN)
    {
        self.viewControllers = _secondArray;
        self.selectedIndex = TAB_BAR_CONTROLLER_GAIN;
    }
    else{
        
    }
}

-(void)setSelectedIndex:(NSUInteger)selectedIndex{
    if( selectedIndex == TAB_BAR_CONTROLLER_MAIN)
    {
        super.selectedIndex = selectedIndex;
        [self.tabBar setHidden:YES];
    }
    else if( selectedIndex == TAB_BAR_CONTROLLER_GAIN)
    {
        super.selectedIndex = selectedIndex;
        [self.tabBar setHidden:NO];
    }
    else{
        
    }
    
    NSLog(@" index = %lu " , (unsigned long)super.selectedIndex);
}

@end
