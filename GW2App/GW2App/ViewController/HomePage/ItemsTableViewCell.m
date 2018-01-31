//
//  ItemsTableViewCell.m
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ItemsTableViewCell.h"


@implementation ItemsModel
@end


@interface ItemsTableViewCell()
@property (nonatomic , strong) UIImageView *bgImageView;
@property (nonatomic , strong) UILabel *titleLabel;
@end


@implementation ItemsTableViewCell

/*  覆寫自定TableViewCell */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setBackgroundColor:[UIColor clearColor]];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 110)];
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

-(void)setupCell:(ItemsModel *)model{
    [self setupCellWithItemsImage:model.bg
                        withTitle:model.timetitle];
}

-(void)setupCellWithItemsImage:(UIImage *)bgImage
                  withTitle:(NSString *)title{
    

    /* BackgroundImage */
    
    if( _bgImageView == nil ){
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width,110)];
        [self addSubview:_bgImageView];
    }
    
    [_bgImageView setImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake( 15, 15, 25, 25) resizingMode:UIImageResizingModeStretch]];
    
    
    
    
    /* bossTitle */
//    if(_titleLabel == nil){
//        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_bgImageView.center.x, 15.0f, 100.0f, 30.0f)];
//        _titleLabel.font = [UIFont boldSystemFontOfSize:22.0f];
//        [_titleLabel setTextColor: [UIColor whiteColor]];
//        [_bgImageView addSubview:_titleLabel];
//    }
//    
//    [_titleLabel setText:title];
}


@end
