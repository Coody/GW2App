//
//  WorldBossTableViewCell.h
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <UIKit/UIKit.h>

extern float const kWorldBossTableViewCellHight;
extern float const kWorldBossTableViewCellSelectedHight;

@interface WorldBossModel : NSObject
@property (nonatomic , assign) BOOL isSelected;
@property (nonatomic , strong) UIImage *bg;
@property (nonatomic , strong) UIImage *bossImage;
@property (nonatomic , strong) NSString *title;
@end


@interface WorldBossTableViewCell : UITableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

-(void)setupCell:(WorldBossModel *)model;

/* 貼上cell資料 */
-(void)setupCellWithBgImage:(UIImage *)bgImage
              withBossImage:(UIImage *)bossImage
                  withTitle:(NSString *)title
                  withIndex:(BOOL) bSel;

//-(void)setSelected:(BOOL)selected;

@end
