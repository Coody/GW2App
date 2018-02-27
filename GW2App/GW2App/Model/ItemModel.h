//
//  ItemModel.h
//  GW2App
//
//  Created by min_liu on 2018/2/8.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ModelManager.h"

@interface ItemModel : NSObject <ModelProtocol>

@property (nonatomic , strong) NSDate *gemsDate;
@property (nonatomic , strong) NSDate *goldDate;
@property (nonatomic , strong) NSNumber *gems;
@property (nonatomic , strong) NSNumber *gold;
@property (nonatomic , strong) NSNumber *gemsToGold;
@property (nonatomic , strong) NSNumber *goldToGems;
@end
