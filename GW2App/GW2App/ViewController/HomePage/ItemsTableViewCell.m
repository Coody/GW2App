//
//  ItemsTableViewCell.m
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "ItemsTableViewCell.h"

#import "ItemsViewController.h"

#import "Constants.h"
//web gold轉換
#import "GoldRequest.h"
#import "GemsRequest.h"

typedef enum : NSInteger{
    EnumItemIndex_None       = 0,
    EnumItemIndex_GoldToGems = 1,
    EnumItemIndex_GemsToGold = 2,
    
}EnumItemsCange;

@implementation ItemsModel
@end


@interface ItemsTableViewCell()
@property (nonatomic , strong) UIImageView *bgImageView;
@property (nonatomic , strong) UILabel *TimeLabel;
@property (nonatomic , strong) UITextView *setTextView;
@property (nonatomic , strong) UILabel *readLabel;

@property (nonatomic , strong) GoldRequest *goldRequest;
@property (nonatomic , strong) GemsRequest *gemRequest;
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
    
    //時間顯示
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSDate *date = [NSDate date];
    //正規化的格式設定
    [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
    //正規化取得的系統時間並顯示
    NSLog(@"更新時間: %@", [formatter stringFromDate:date]);
    
    model.timetitle = [formatter stringFromDate:date];
    [self setupCellWithItemsImage:model.bg
                        withTitle:model.timetitle
                          withSel:model.sel];
    //取得gold
    __weak __typeof(self)weakSelf = self;
    _goldRequest = [[GoldRequest alloc] initWithSuccessBlock:^(NSError *error, id result) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;

                _readLabel.text = [NSString stringWithFormat:@"%ld", (long)_goldRequest.resdCoinPreGem];
        
    } withFailBlock:^(NSError *error, NSNumber *errorCode, NSString *errorMsg) {
    }];
    
    //取得gems
//    __weak __typeof(self)weakSelf = self;
    _gemRequest = [[GemsRequest alloc] initWithSuccessBlock:^(NSError *error, id result) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        _readLabel.text = [NSString stringWithFormat:@"%ld", (long)_gemRequest.resdGemPreCoin];
        
    } withFailBlock:^(NSError *error, NSNumber *errorCode, NSString *errorMsg) {
    }];
    //目前設定必須有10000
    
    
    switch(model.sel){
        case EnumItemIndex_GoldToGems:
            if([_setTextView.text integerValue] < 10000){
                _setTextView.text = @"10000";
            }
            
            [_goldRequest setGolds: [_setTextView.text integerValue]];
            [_goldRequest send];
            break;
        case EnumItemIndex_GemsToGold:
            if([_setTextView.text integerValue] < 10){
                _setTextView.text = @"10";
            }

            [_gemRequest setGems: [_setTextView.text integerValue]];
            [_gemRequest send];
            break;
        default:
            NSLog(@"Error");
            break;
    }
    
}

-(void)setupCellWithItemsImage:(UIImage *)bgImage
                     withTitle:(NSString *)title
                       withSel:(NSInteger)sel{
    
    //BackgroundImage
    if( _bgImageView == nil ){
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.frame.size.width,110)];
        [self addSubview:_bgImageView];
    }
    
    [_bgImageView setImage:[bgImage resizableImageWithCapInsets:UIEdgeInsetsMake( 15, 15, 25, 25) resizingMode:UIImageResizingModeStretch]];
    
    //Label
    if(_TimeLabel == nil){
        _TimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150.0f, 5.0f, 180.0f, 15.0f)];
        _TimeLabel.font = [UIFont boldSystemFontOfSize:12.0f];
        [_TimeLabel setTextColor: [UIColor whiteColor]];
        [self addSubview:_TimeLabel];
    }
    
    [_TimeLabel setText: title];

    
    
    //TextView input
    //設定UITextView的位置大小與內文
    if(_setTextView == nil ){
        
        _setTextView = [[UITextView alloc] initWithFrame:CGRectMake(10, 55, 100, 35)];

        //設定橘色背景與棕色邊框
        [_setTextView setBackgroundColor:[UIColor clearColor]];
        //指定內文字體大小並置中
        [_setTextView setFont:[UIFont boldSystemFontOfSize:24.0]];
        //設定無法再被編輯
        [_setTextView setEditable:YES];
        //使內文保持在UITextView邊框之內
        [_setTextView setClipsToBounds: YES];
        //加入主畫面
        [self addSubview:_setTextView];
        [_setTextView setText:@"?"];
    }
    
    if(_readLabel == nil){
        _readLabel.text = @"9";
        _readLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width / 2.0f +15.0f, 55.0f, 100.0f, 35.0f)];
        _readLabel.font = [UIFont boldSystemFontOfSize:24.0f];
        [self addSubview:_readLabel];
    }
    
    
    /* 選擇更新資料 */
    switch(sel){
        case EnumItemIndex_None:
            _setTextView.textColor = [UIColor redColor];
            _readLabel.textColor = [UIColor redColor];
            break;
        case EnumItemIndex_GoldToGems:
            _setTextView.textColor = [UIColor yellowColor];
            _readLabel.textColor = VC_START_MENU_BACKGROUND_COLOR;
            break;
        case EnumItemIndex_GemsToGold:
            _readLabel.textColor = [UIColor yellowColor];
            _setTextView.textColor = VC_START_MENU_BACKGROUND_COLOR;
            break;
        default:
            NSLog(@"Error");
            break;
    }

}

@end
