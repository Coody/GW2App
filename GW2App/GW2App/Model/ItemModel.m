//
//  ItemModel.m
//  GW2App
//
//  Created by min_liu on 2018/2/8.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ItemModel.h"

static NSString *const kGetGemsDate   = @"kGetGemsDate";
static NSString *const kGetGems       = @"kGetgems";
static NSString *const kGetgemsToGold = @"kGetgemsToGold";

@implementation ItemModel
@synthesize gemsDate = _gemsDate;
@synthesize gems = _gems;
@synthesize gemsToGold = _gemsToGold;

/* 將gemsDate值存入本地端 */
-(void)setGemsDate:(NSDate *)gemsDate{
    if( gemsDate != nil ){
        _gemsDate = gemsDate;
        [[NSUserDefaults standardUserDefaults] setObject:_gemsDate forKey:kGetGemsDate];
    }
    else{
        NSLog(@"Get Gems Data is nil !!!");
    }
}

/* 讀出本地端gemsDate */
-(NSDate *)gemsDate{
    _gemsDate = [[NSUserDefaults standardUserDefaults] objectForKey:kGetGemsDate];
    return _gemsDate;
}


/* 將gems值存入本地端 */
-(void)setGems:(NSNumber *)gems{
    if( gems != nil ){
        _gems = gems;
        [[NSUserDefaults standardUserDefaults] setObject:_gems forKey:kGetGems];
    }
    else{
        NSLog(@"Get Gems is nil !!!");
    }
}

/* 讀出本地端gems */
-(NSNumber *)gems{
    _gems = [[NSUserDefaults standardUserDefaults] objectForKey:kGetGems];
    return _gems;
}


/* 將gemsToGold值存入本地端 */
-(void)setGemsToGold:(NSNumber *)gemsToGold{
    if( gemsToGold != nil ){
        _gemsToGold = gemsToGold;
        [[NSUserDefaults standardUserDefaults] setObject:_gemsToGold forKey:kGetgemsToGold];
    }
    else{
        NSLog(@"Get Gems is nil !!!");
    }
}

/* 讀出本地端gemsToGold */
-(NSNumber *)gemsToGold{
    _gemsToGold = [[NSUserDefaults standardUserDefaults] objectForKey:kGetgemsToGold];
    return _gemsToGold;
}


-(void)clearModel{
    self.gemsDate = nil;
    
}

@end
