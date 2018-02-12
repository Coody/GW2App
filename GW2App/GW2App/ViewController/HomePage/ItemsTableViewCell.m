//
//  ItemsTableViewCell.m
//  GW2App
//
//  Created by min_liu on 2018/1/30.
//  Copyright © 2018年 min_liu. All rights reserved.
//
#import <objc/runtime.h>

#import "ItemsTableViewCell.h"

#import "ItemsViewController.h"
#import "Constants.h"

//web gold轉換
#import "GoldRequest.h"
#import "GemsRequest.h"

// for Tools
#import "ModelKey.h"
#import "ModelManager.h"
#import "ItemModel.h"


@implementation ItemsModel
@synthesize recentDate = _recentDate;
@synthesize recentGems = _recentGems;
@synthesize recentGemsToGold = _recentGemsToGold;


-(void)setRecentDate:(NSDate *)recentDate{
    if( recentDate != nil ){
        _recentDate = recentDate;
        ItemModel *itemModel = (ItemModel *)[[ModelManager sharedInstance] getModelWithKey:D_ITEMS_KEY];
        itemModel.gemsDate = _recentDate;
    }
}

-(NSDate *)recentDate{
    ItemModel *itemModel = (ItemModel *)[[ModelManager sharedInstance] getModelWithKey:D_ITEMS_KEY];
    _recentDate = itemModel.gemsDate;
    return _recentDate;
}

-(void)setRecentGems:(NSNumber *)recentGems{
    if( recentGems != nil ){
        _recentGems = recentGems;
        ItemModel *itemModel = (ItemModel *)[[ModelManager sharedInstance] getModelWithKey:D_ITEMS_GEMS_KEY];
        itemModel.gems = _recentGems;
    }
}

-(NSNumber *)recentGems{
    ItemModel *itemModel = (ItemModel *)[[ModelManager sharedInstance] getModelWithKey:D_ITEMS_GEMS_KEY];
    _recentGems = itemModel.gems;
    return _recentGems;
}

-(void)recentGemsToGold:(NSNumber *)recentGemsToGold{
    if( recentGemsToGold != nil ){
        _recentGemsToGold = recentGemsToGold;
        ItemModel *itemModel = (ItemModel *)[[ModelManager sharedInstance] getModelWithKey:D_ITEMS_GEMS_TO_GOLD_KEY];
        itemModel.gemsToGold = _recentGemsToGold;
    }
}

-(NSNumber *)recentGemsToGold{
    ItemModel *itemModel = (ItemModel *)[[ModelManager sharedInstance] getModelWithKey:D_ITEMS_GEMS_TO_GOLD_KEY];
    _recentGemsToGold = itemModel.gemsToGold;
    return _recentGemsToGold;
}
@end


@interface ItemsTableViewCell()
@property (nonatomic , assign) EnumItemsCange cellType;
@property (nonatomic , strong) ItemsModel *model;
@property (nonatomic , strong) UIImageView *bgImageView;
// FIXME: 類別內的成員變數第一個字母盡量不要大寫
@property (nonatomic , strong) UILabel *TimeLabel;
@property (nonatomic , strong) UITextView *setTextView;
@property (nonatomic , strong) UILabel *readLabel;

@property (nonatomic , strong) GoldRequest *goldRequest;
@property (nonatomic , strong) GemsRequest *gemRequest;


@property (nonatomic, strong) UIActivityIndicatorView *loadingView;
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

-(void)setupItemCell:(ItemsModel *)model{
    
    _model = model;
    
    //時間顯示
    [self setDate:model.recentDate];
    
    [self setupCellWithItemsImage:model.bg
                        withTitle:model.timetitle
                          withSel:model.sel];
    
    // FIXME: request 應該拿出去外面做，不應該在裡面實作了。（且滑動很快，這個 cell 如果有 reuse 則會不斷發出 request）
    //取得gold
    __weak __typeof(self)weakSelf = self;
    _goldRequest = [[GoldRequest alloc] initWithSuccessBlock:^(NSError *error, id result) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        GoldRequestModel *goldModel = (GoldRequestModel *)result;
        strongSelf.readLabel.text = [NSString stringWithFormat:@"%@", goldModel.coins_per_gem];
        
        [strongSelf setDate:[NSDate date]];
        
        /* LoadingEnd */
        [strongSelf removeLoading];
        
    } withFailBlock:^(NSError *error, NSNumber *errorCode, NSString *errorMsg) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        /* LoadingEnd */
        [strongSelf removeLoading];
    }];
    
    //取得gems
    _gemRequest = [[GemsRequest alloc] initWithSuccessBlock:^(NSError *error, id result) {
        __strong __typeof(weakSelf) strongSelf = weakSelf;
        
        
        GemsRequestModel *gemModel = (GemsRequestModel *)result;
        _readLabel.text = [NSString stringWithFormat:@"%@", gemModel.coins_per_gem];
        
        [strongSelf setDate:[NSDate date]];
        
        /* LoadingEnd */
        [strongSelf removeLoading];
        
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

-(void)setDate:(NSDate *)recentDate{
    NSString *formatDate;
    if( recentDate == nil ){
        formatDate = @"?";
    }
    else{
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        // 正規化的格式設定
        [formatter setDateFormat:@"YYYY/MM/dd HH:mm:ss"];
        
        // 正規化取得的系統時間並顯示
        formatDate = [formatter stringFromDate:recentDate];
        
        NSLog(@"更新時間: %@", formatDate);
        
        _model.recentDate = recentDate;
    }
    _model.timetitle = [NSString stringWithFormat:@"更新時間: %@" , formatDate ];
}

-(void)setGems:(NSNumber *)recentGems{
    
    _setTextView.text = @"?";
    if(recentGems != nil)
    {
        _model.recentGems = recentGems;
    }
}

-(void)setGemsToGold:(NSNumber *)recentGemsToGold{
    
    _readLabel.text = @"?";
    if(recentGemsToGold != nil)
    {
        _model.recentGemsToGold = recentGemsToGold;
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
        _TimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(120.0f, 5.0f, 220.0f, 15.0f)];
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

/* 展示Loading（默认灰色）*/
- (void)showLoading {
    // 默认展示灰色loading
    [self showLoadingWithColor:[UIColor grayColor]];
}

/* 展示指定颜色的Loading */
- (void)showLoadingWithColor:(UIColor *)color {
    if (self.loadingView) {
        /* 重複執行時移除 */
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
    }
    
    self.loadingView = [[UIActivityIndicatorView alloc] initWithFrame:self.bounds];
    [self addSubview:self.loadingView];
    self.loadingView.color = color;
    [self.loadingView startAnimating];
    self.loadingView.userInteractionEnabled = NO;
}

/* 移除Loading */
- (void)removeLoading {
    if (self.loadingView) {
        [self.loadingView removeFromSuperview];
        self.loadingView = nil;
    }
}

@end
