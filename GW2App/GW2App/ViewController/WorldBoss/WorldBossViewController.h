//
//  WorldBossViewController.h
//  GW2App
//
//  Created by min_liu on 2018/1/18.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorldBossViewController : UIViewController


@property (strong , nonatomic) UITableView *worldBossTableView;
@property (strong , nonatomic) NSArray *contentArray;

@property (nonatomic , assign) NSUInteger selectedIndex;


@end
