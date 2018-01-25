//
//  TableViewCell.h
//  GW2App
//
//  Created by min_liu on 2018/1/22.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <UIKit/UIKit.h>

extern float const kWorldBossTableViewCellHight;

//@interface WorldBossModel : NSObject
//@property (nonatomic , strong) UIImageView *bg;
//@property (nonatomic , strong) UIImageView *bossImage;
//@property (nonatomic , strong) UILabel *titleLabel;
//@end



@interface TableViewCell : UITableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;



/* 貼上cell資料 */
-(void)setupCellWithBgImage:(UIImage *)bgImage
              withBossImage:(UIImage *)bossImage
                  withTitle:(NSString *)title;

@end
