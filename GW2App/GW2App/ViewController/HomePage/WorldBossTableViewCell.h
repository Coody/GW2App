//
//  WorldBossTableViewCell.h
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WorldBossModel.h"

extern float const kWorldBossTableViewCellHight;
extern float const kWorldBossTableViewCellSelectedHight;
extern NSString *const cellIdentifier;

@interface WorldBossTableViewCell : UITableViewCell


@property (nonatomic , assign) BOOL isSelected;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

// FIXME: 方法名稱不要這樣寫，沒有人會知道你要傳送什麼進去
-(void)setupCell:(WorldBossModel *)model
                :(NSIndexPath *)index
                :(BOOL)bSel;

/* 貼上cell資料 */
//-(void)setupCellWithBgImage:(UIImage *)bgImage
//              withBossImage:(UIImage *)bossImage
//                  withTitle:(NSString *)title
//                  withIndex:(BOOL) bSel;

/* 貼上cell資料 */
-(void)setupCellWithTime:(NSDate *)time
       withBossImagePath:(NSString *)bossImageName
           withTitlePath:(NSString *)title
         withContextPath:(NSString *)context
                SelIndex:(NSIndexPath *)index
               withIndex:(bool)bSel;

@end
