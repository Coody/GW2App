//
//  AppDelegate+Websites.m
//  GW2App
//
//  Created by min_liu on 2018/2/7.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "AppDelegate+Websites.h"

//web link
#import "WebsiteBase.h"
@implementation AppDelegate (Websites)

/* 與網站連線 */
-(void) setWebRequestUrl{
    
    [[WebsiteBase sharedInstance] setHomeUrl:@"https://api.guildwars2.com/v2"];
}
@end
