//
//  GoldRequest.m
//  GW2App
//
//  Created by min_liu on 2018/2/1.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "GoldRequest.h"


//https://wiki.guildwars2.com/wiki/API:2/commerce/exchange/coins
/* 建置一個空Model的實作 */
@implementation GoldRequestModel
@end

@interface GoldRequest()
@property (nonatomic, assign) NSInteger gold;
@end

@implementation GoldRequest

/* 不使用封包表頭 */
-(BOOL)isNeedHeader{
    return NO;
}
/* 模式是 get(get post)網站傳回封包 */
-(EnumWebsiteType)setWebsiteType{
    return EnumWebsiteType_Get;
}

/* 設定為Home */
-(EnumUrlType)setUrlType{
    return EnumUrlType_Home;
}

/* 取得coin的網址子段 */
-(NSString *)setTailUrl{
    return @"commerce/exchange/coins";
}

/* 取得coin的網址與金錢數量 */
-(NSDictionary *)setParams{
    return @{@"quantity":[NSNumber numberWithInteger:self.gold]};
}

/* 設定回復狀態 */
-(id<AbstractJSONModelProtocol>)parseResponse:(id)responseObject{
    NSError *error = nil;
    GoldRequestModel *model = [[GoldRequestModel alloc] initWithDictionary:responseObject
                                                                     error:&error];
    
    return model;
}

/* 設定coin */
-(void)setGolds:(NSInteger)golds{
    
    self.gold = golds;
}


@end
