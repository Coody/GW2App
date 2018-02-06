//
//  GemsRequest.h
//  GW2App
//
//  Created by min_liu on 2018/2/2.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WebApiRequest.h"
/* 製作一個class繼承 JSONModel */
@interface GemsRequestModel : JSONModel
/* 設定gem值 */
@property(nonatomic,strong) NSNumber *coins_per_gem;
/* web返回值 */
@property (nonatomic,strong)  NSNumber *quantity;
@end


@interface GemsRequest : WebApiRequest <WebApiRequestProtocol>

/* 設定Gems數量 */
-(void)setGems:(NSInteger)gems;

/* 返回轉換Coin */
-(NSInteger)resdGemPreCoin;

@end
