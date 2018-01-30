//
//  ItemsTableViewCell.m
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ItemsTableViewCell.h"

@implementation ItemsTableViewCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setupCellWithItemsImage:(UIImage *)bgImage
                  withTitle:(NSString *)title{
    

    /* BackgroundImage */
    // initial
    if( _bgImageView == nil ){
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width*0.05, 0.0f, self.frame.size.width, self.frame.size.height)];
        
    }
    [self addSubview:_bgImageView];
    
    
    
    
//    /* BossImage */
//    if(_bossImageView == nil ){
//        _bossImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15,
//                                                                       _bgImageView.frame.size.width*0.36,
//                                                                       _bgImageView.frame.size.height *0.6)];
//        [_bgImageView addSubview:_bossImageView];
//    }
//    [_bossImageView setImage:bossImage];
    
    
    
    /* bossTitle */
    if(_titleLabel == nil){
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(_bgImageView.center.x, 15.0f, 100.0f, 30.0f)];

    }
    _titleLabel.font = [UIFont boldSystemFontOfSize:22.0f];
    [_titleLabel setTextColor: [UIColor whiteColor]];
    [_bgImageView addSubview:_titleLabel];
    [_titleLabel setText:title];
    
}

@end
