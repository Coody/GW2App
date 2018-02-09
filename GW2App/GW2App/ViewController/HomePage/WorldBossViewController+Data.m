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
    NSString *worldBossDataString = [[NSBundle mainBundle] pathForResource:kWorldBossPlistFileName ofType:kWorldBossPlistFileType];
    
    NSDictionary *dataDic = [[NSDictionary alloc] initWithContentsOfFile:worldBossDataString];
    
    NSMutableArray *modelArray = [[NSMutableArray alloc] initWithCapacity:[dataDic count]];
    
    for ( NSDictionary *key in dataDic.allKeys ) {
        NSDictionary *valueDic = [dataDic objectForKey:key];
        WorldBossModel *model = [[WorldBossModel alloc] init];
        
        model.bossImageName = [valueDic objectForKey:@"image"];
        model.title = [valueDic objectForKey:@"title"];
        model.context = [valueDic objectForKey:@"context"];
        model.time = [valueDic objectForKey:@"time"];
        
        [modelArray addObject:model];
    }
    return modelArray;
}

@end
