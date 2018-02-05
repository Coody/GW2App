//
//  GoldRequest.h
//  GW2App
//
//  Created by min_liu on 2018/2/1.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WebApiRequest.h"

/* 製作一個class繼承 JSONModel */
@interface GoldRequestModel : JSONModel
/* 設定coin值 */
@property (nonatomic, strong) NSNumber *coins_per_gem;
/* web返回值 */
@property (nonatomic,strong)  NSNumber *quantity;
@end

/* Gold轉換使用 WebApi協定 */
@interface GoldRequest : WebApiRequest <WebApiRequestProtocol>

/* 設定Gold數量 */
-(void)setGolds:(NSInteger)golds;
/* 返回轉換Gem */
-(NSInteger)resdCoinPreGem;
@end
