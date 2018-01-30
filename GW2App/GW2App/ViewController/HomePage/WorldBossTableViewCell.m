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
float const kWorldBossTableViewCellSelectedHight = 150;

static NSString *const kWorldBossPlistString = @"worldBoss.plst";

@implementation WorldBossModel
@end

@interface WorldBossTableViewCell()


@property (nonatomic , strong) UIImageView *bgImageView;
@property (nonatomic , strong) UIImageView *bossImageView;
@property (nonatomic , strong) UILabel *titleLabel;

@end

@implementation WorldBossTableViewCell
/*  覆寫自定TableViewCell */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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

/* 設定sel是否選擇 */
-(void)setSelected:(BOOL)selected
{
    [super setSelected:selected animated:YES];
    if( selected == YES ){
        __weak __typeof(self)weakSelf = self;
        [UIView animateWithDuration:0.3f animations:^{
            __strong __typeof(weakSelf)strongSelf = weakSelf;
            /* 調整BossImage大小 */
            [strongSelf.bgImageView setFrame:CGRectMake(strongSelf.bgImageView.frame.origin.x,
                                                        strongSelf.bgImageView.frame.origin.y,
                                                        strongSelf.bgImageView.frame.size.width,
                                                        kWorldBossTableViewCellSelectedHight)];
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
            /* 調整cell大小 */
            [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, kWorldBossTableViewCellHight)];
        }];
    }
    
}

/* 貼上cell資料 */
-(void)setupCellWithBgImage:(UIImage *)bgImage
              withBossImage:(UIImage *)bossImage
                  withTitle:(NSString *)title
                  withIndex:(bool) bSel{
    
    [self setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kWorldBossTableViewCellHight)];
    
    /* BackgroundImage */
    // initial
    if( _bgImageView == nil ){
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 300.0f, kWorldBossTableViewCellHight)];
    }
    
    [_bgImageView setImage:bgImage];
    [self addSubview:_bgImageView];
    
    
    /* BossImage */
    if(_bossImageView == nil ){
        _bossImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 60,
                                                                       _bgImageView.frame.size.width*0.36,
                                                                       _bgImageView.frame.size.height *0.8)];
    }
    _bossImageView.center = CGPointMake((self.center.x - 10.0) / 2.0, 58.0);
    [_bossImageView setImage:bossImage];
    [self addSubview:_bossImageView];
    
    
    /* bossTitle */
    if(_titleLabel == nil){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.center.x, 15.0f, 100.0f, 30.0f)];
    }
    
    [_titleLabel setText:title];
    _titleLabel.font = [UIFont boldSystemFontOfSize:22.0f];
    [_titleLabel setTextColor: [UIColor whiteColor]];
    [self addSubview:_titleLabel];
    self.selected = bSel;
}


@end
