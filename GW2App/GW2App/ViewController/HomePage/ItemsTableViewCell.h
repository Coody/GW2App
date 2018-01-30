//
//  ItemsTableViewCell.h
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsTableViewCell : UITableViewCell

@property (nonatomic , strong) UIImageView *bgImageView;
@property (nonatomic , strong) UIImageView *bossImageView;
@property (nonatomic , strong) UILabel *titleLabel;

/* 貼上cell資料 */
-(void)setupCellWithItemsImage:(UIImage *)bgImage
                  withTitle:(NSString *)title;
@end
