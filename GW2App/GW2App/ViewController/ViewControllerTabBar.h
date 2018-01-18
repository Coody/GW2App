//
//  ViewControllerTabBar.h
//  GW2BroH
//
//  Created by CoodyChou on 2015/5/29.
//

#import <UIKit/UIKit.h>

#import "Constants.h"

enum{
    TAB_BAR_CONTROLLER_MAIN,
    TAB_BAR_CONTROLLER_GAIN,
    TAB_BAR_CONTROLLER_LOGIN,
    
};

@interface ViewControllerTabBar : UITabBarController

-(void)changeViewControllerWithIndex:(EnumTabBarIndex)index;
-(int)getTabBarIndex;

@end
