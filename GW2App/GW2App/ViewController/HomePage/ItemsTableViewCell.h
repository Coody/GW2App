//
//  ItemsTableViewCell.h
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSInteger{
    EnumItemIndex_None       = 0,
    EnumItemIndex_GoldToGems = 1,
    EnumItemIndex_GemsToGold = 2,
}EnumItemsCange;

@interface ItemsModel : NSObject
@property (nonatomic , strong) UIImage  *bg;
@property (nonatomic , strong) NSDate *recentDate;
@property (nonatomic , strong) NSNumber *recentGems;
@property (nonatomic , strong) NSNumber *recentGemsToGold;

@property (nonatomic , strong) NSString *timetitle;
@property (nonatomic , assign) NSUInteger sel;
@property (nonatomic , assign) EnumItemsCange cellType;
@end

@interface ItemsTableViewCell : UITableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


-(void)setupItemCell:(ItemsModel *)model;

/* 貼上cell資料 */
-(void)setupCellWithItemsImage:(UIImage *)bgImage;

/* 回傳目前LoadingView狀態 */
- (UIActivityIndicatorView *)loadingView;

/* 展示Loading（默认灰色) */
- (void)showLoading;

/* 展示指定颜色的Loading */
- (void)showLoadingWithColor:(UIColor *)color;

/* 移除Loading */
- (void)removeLoading;

@end
