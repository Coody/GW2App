//
//  WorldBossViewController+Data.m
//  GW2App
//
//  Created by min_liu on 2018/2/9.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WorldBossViewController+Data.h"

// for Model
#import "WorldBossModel.h"
#import "WorldBossViewController.h"

static NSString *const kWorldBossPlistFileName = @"worldBoss";
static NSString *const kWorldBossPlistFileType = @"plist";

@implementation WorldBossViewController (Data)

-(NSMutableArray *)getWorldBossPlist{
    /* 資料字串化 */
    NSString *worldBossDataString = [[NSBundle mainBundle] pathForResource:kWorldBossPlistFileName ofType:kWorldBossPlistFileType];
    
    /* 資料字串存成字典 */
    NSDictionary *dataDic = [[NSDictionary alloc] initWithContentsOfFile:worldBossDataString];
    NSMutableArray *modelArray = [[NSMutableArray alloc] initWithCapacity:[dataDic count]];
    
    
    /* 讀取plist資料 */
    for ( NSDictionary *key in dataDic.allKeys ) {
        NSDictionary *valueDic = [dataDic objectForKey:key];
        WorldBossModel *model = [[WorldBossModel alloc] init];
        
        model.bossImageName = [valueDic objectForKey:@"image"];
        model.title = [valueDic objectForKey:@"title"];
        model.context = [valueDic objectForKey:@"context"];
        model.time = [valueDic objectForKey:@"time"];
        
        [modelArray addObject:model];
    }
    
    /* 通過對可變數組的字典的某个key值建立排序依據-時間 */
    NSSortDescriptor *distanceDescriptor = [[NSSortDescriptor alloc] initWithKey:@"time" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObjects:distanceDescriptor,nil];
    
    /* 依時間排序 */
    [modelArray sortUsingDescriptors:descriptors];
    
    return modelArray;
}

@end
