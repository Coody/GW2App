//
//  GemsRequest.m
//  GW2App
//
//  Created by min_liu on 2018/2/2.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "GemsRequest.h"


//https://wiki.guildwars2.com/wiki/API:2/commerce/exchange/gems


@implementation GemsRequestModel
@end


@interface GemsRequest()
@property (nonatomic, assign) NSInteger gems;
@property (nonatomic, assign) NSInteger coin;
@end

@implementation GemsRequest

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
    return @"commerce/exchange/gems";
}

/* 取得coin的網址與金錢數量 */
-(NSDictionary *)setParams{
    return @{@"quantity":[NSNumber numberWithInteger:self.gems]};
}

/* 設定回復狀態 */
-(id<AbstractJSONModelProtocol>)parseResponse:(id)responseObject{
    NSError *error = nil;
    GemsRequestModel *model = [[GemsRequestModel alloc] initWithDictionary:responseObject
                                                                     error:&error];
    /* 轉換值保留下來 */
    _coin = [model.coins_per_gem integerValue];
    return model;
}

/* 返回轉換Gem */
-(NSInteger)resdGemPreCoin{
    
    return _coin;
}
-(void)setGems:(NSInteger)gems{
    _gems = gems;
}

@end
