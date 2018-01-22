//
//  ViewControllerNavigationController.h
//  GW2App
//
//  Created by min_liu on 2018/1/12.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewControllerNavigationController : UINavigationController

/**
 * @brief 基礎的 NavigationController 控制元件
 *
 * @detail
 *
 * @param firstViewController : 塞入第一個畫面（必須繼承 UIViewController ）的實體
 */
-(instancetype)initWithFirstViewcontroller:(UIViewController *)firstViewController;

@end

