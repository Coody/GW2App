//
//  WorldBossModel.h
//  GW2App
//
//  Created by min_liu on 2018/2/9.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface WorldBossModel : NSObject
@property (nonatomic , assign) BOOL isSelected;
@property (nonatomic , strong) NSString *bossImageName;
@property (nonatomic , strong) NSString *title;
@property (nonatomic , strong) NSString *context;
@property (nonatomic , strong) NSDate *time;
@end
