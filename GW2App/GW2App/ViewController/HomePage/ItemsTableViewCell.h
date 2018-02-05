//
//  ItemsTableViewCell.h
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsModel : NSObject
@property (nonatomic , strong) UIImage  *bg;
@property (nonatomic , strong) NSString *timetitle;
@property (nonatomic , assign) NSUInteger sel;
@end

@interface ItemsTableViewCell : UITableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

-(void)setupCell:(ItemsModel *)model;

/* 貼上cell資料 */
-(void)setupCellWithItemsImage:(UIImage *)bgImage
                     withTitle:(NSString *)title
                       withSel:(NSInteger)sel;

/* 回傳目前LoadingView狀態 */
- (UIActivityIndicatorView *)loadingView;

/* 展示Loading（默认灰色) */
- (void)showLoading;

/* 展示指定颜色的Loading */
- (void)showLoadingWithColor:(UIColor *)color;

/* 移除Loading */
- (void)removeLoading;

@end
