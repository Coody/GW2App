//
//  TableViewCell.m
//  GW2App
//
//  Created by min_liu on 2018/1/22.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "TableViewCell.h"

#import "Constants.h"
#import "GW2BroH_Tools.h"

float const kWorldBossTableViewCellHight = 40;

static NSString *const kWorldBossPlistString = @"worldBoss.plst";

@interface TableViewCell()
@property (nonatomic , strong) UIImageView *bgImageView;
@property (nonatomic , strong) UIImageView *bossImageView;
@property (nonatomic , strong) UILabel *titleLabel;
@end

@implementation TableViewCell

/*  覆寫自定TableViewCell */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = VC_OTHERS_BACKGROUND_COLOR;
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

/* 貼上cell資料 */
-(void)setupCellWithBgImage:(UIImage *)bgImage
              withBossImage:(UIImage *)bossImage
                  withTitle:(NSString *)title{

    
    /* BackgroundImage */
    if( _bgImageView == nil ){
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 300.0f, 100.0f)];

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

    
}

@end
