//
//  WorldBossTableViewCell.m
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WorldBossTableViewCell.h"


#import "Constants.h"
#import "GW2BroH_Tools.h"

float const kWorldBossTableViewCellHight = 110;
float const kWorldBossTableViewCellSelectedHight = 440;

static NSString *const kWorldBossPlistString = @"worldBoss.plst";

@implementation WorldBossModel
@end

@interface WorldBossTableViewCell()


@property (nonatomic , strong) UIImageView *bgImageView;
@property (nonatomic , strong) UIImageView *bossImageView;
@property (nonatomic , strong) UILabel *titleLabel;


@end

// FIXME: 沒用的 code 要拿掉
//typedef enum : int{
//    EnumBossIndex_1 = 0,
//    EnumBossIndex_2 = 1,
//    EnumBossIndex_3 = 2,
//    EnumBossIndex_4 = 3,
//    EnumBossIndex_5 = 4,
//    EnumBossIndex_6 = 5,
//    EnumBossIndex_7 = 6,
//    EnumBossIndex_8 = 7,
//    EnumBossIndex_9 = 8,
//}EnumBossIndex;

@implementation WorldBossTableViewCell
/*  覆寫自定TableViewCell */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kWorldBossTableViewCellHight)];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCell:(WorldBossModel *)model{
    [self setupCellWithBgImage:model.bg
                 withBossImage:model.bossImage
                     withTitle:model.title
                     withIndex:model.isSelected];
}

/* 貼上cell資料 */
-(void)setupCellWithBgImage:(UIImage *)bgImage
              withBossImage:(UIImage *)bossImage
                  withTitle:(NSString *)title
                  withIndex:(bool) bSel{
    
    /* BackgroundImage */
    // initial
    if( _bgImageView == nil ){
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.05, 0.0f, self.frame.size.width*0.9, kWorldBossTableViewCellHight*0.9)];
        [self addSubview:_bgImageView];
    }
    
    [_bgImageView setImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake( 15, 15, 25, 25) resizingMode:UIImageResizingModeStretch]];
    
    
    
    /* BossImage */
    if(_bossImageView == nil ){
        _bossImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15,
                                                                       _bgImageView.frame.size.width*0.36,
                                                                       _bgImageView.frame.size.height *0.6)];
        [_bgImageView addSubview:_bossImageView];
    }
    [_bossImageView setImage:bossImage];
    
    
    
    /* bossTitle */
    if(_titleLabel == nil){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_bgImageView.center.x, 15.0f, 100.0f, 30.0f)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:22.0f];
        [_titleLabel setTextColor: [UIColor whiteColor]];
        [_bgImageView addSubview:_titleLabel];
    }
    
    [_titleLabel setText:title];
    
    if( bSel == YES ){
        [_bgImageView setFrame:CGRectMake(self.frame.size.width*0.05, 0.0f, self.frame.size.width*0.9, kWorldBossTableViewCellSelectedHight * 0.9)];
    }
    else{
        [_bgImageView setFrame:CGRectMake(self.frame.size.width*0.05, 0.0f, self.frame.size.width*0.9, kWorldBossTableViewCellHight)];
    }
    
    _isSelected = bSel;
}

/* 設定cell是否選擇 當cell被點擊時進來*/
-(void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if( isSelected == YES ){
        __weak __typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.3f animations:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            /* 調整BossImage大小 */
            [strongSelf.bgImageView setFrame:CGRectMake(strongSelf.bgImageView.frame.origin.x,
                                                        strongSelf.bgImageView.frame.origin.y,
                                                        strongSelf.bgImageView.frame.size.width,
                                                        kWorldBossTableViewCellSelectedHight)];
            // FIXME: 這裡會有記憶體遺漏，在 block 內的 self 要改成 strongSelf
            /* 調整cell大小 */
            [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, kWorldBossTableViewCellHight)];
            
        }];
    }
    else{
        __weak __typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.3f animations:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            /* 調整BossImage大小 */
            [strongSelf.bgImageView setFrame:CGRectMake(strongSelf.bgImageView.frame.origin.x,
                                                        strongSelf.bgImageView.frame.origin.y,
                                                        strongSelf.bgImageView.frame.size.width,
                                                        kWorldBossTableViewCellHight)];
            // FIXME: 這裡會有記憶體遺漏，在 block 內的 self 要改成 strongSelf
            /* 調整cell大小 */
            [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, kWorldBossTableViewCellHight)];
        }];
    }
}

@end
