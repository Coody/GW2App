//
//  ItemModel.m
//  GW2App
//
//  Created by min_liu on 2018/2/8.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ItemModel.h"

static NSString *const kGetGemsDate   = @"kGetGemsDate";
static NSString *const kGetGoldDate   = @"kGetGoldDate";
static NSString *const kGetGems       = @"kGetgems";
static NSString *const kGetGold       = @"kGetgold";
static NSString *const kGetgemsToGold = @"kGetgemsToGold";
static NSString *const kGetgoldToGems = @"kGetgoldToGems";

@implementation ItemModel
@synthesize gemsDate = _gemsDate;
@synthesize goldDate = _goldDate;
@synthesize gems = _gems;
@synthesize gold = _gold;
@synthesize gemsToGold = _gemsToGold;
@synthesize goldToGems = _goldToGems;

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

/* 將goldDate值存入本地端 */
-(void)setGoldDate:(NSDate *)goldDate{
    if( goldDate != nil ){
        _goldDate = goldDate;
        [[NSUserDefaults standardUserDefaults] setObject:_goldDate forKey:kGetGoldDate];
    }
    else{
        NSLog(@"Get Gold Data is nil !!!");
    }
}

/* 讀出本地端goldDate */
-(NSDate *)goldDate{
    _goldDate = [[NSUserDefaults standardUserDefaults] objectForKey:kGetGoldDate];
    return _goldDate;
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

/* 將gems值存入本地端 */
-(void)setGold:(NSNumber *)gold{
    if( gold != nil ){
        _gold = gold;
        [[NSUserDefaults standardUserDefaults] setObject:_gold forKey:kGetGold];
    }
    else{
        NSLog(@"Get Gold is nil !!!");
    }
}

/* 讀出本地端gems */
-(NSNumber *)gold{
    _gold = [[NSUserDefaults standardUserDefaults] objectForKey:kGetGold];
    return _gold;
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


/* 將goldToGems值存入本地端 */
-(void)setGoldToGems:(NSNumber *)goldToGems{
    if( goldToGems != nil ){
        _goldToGems = goldToGems;
        [[NSUserDefaults standardUserDefaults] setObject:_goldToGems forKey:kGetgoldToGems];
    }
    else{
        NSLog(@"Get Gold is nil !!!");
    }
}

/* 讀出本地端gemsToGold */
-(NSNumber *)goldToGems{
    _goldToGems = [[NSUserDefaults standardUserDefaults] objectForKey:kGetgoldToGems];
    return _goldToGems;
}

-(void)clearModel{
    self.gemsDate = nil;
    
}

@end
