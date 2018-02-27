//
//  ItemsViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/18.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "Constants.h"
#import "GW2BroH_Tools.h"
#import "ItemsViewController.h"
#import "ViewControllerTabBar.h"

#import "ItemsViewController+_TableView.h"
//Navigationtitle
#import "ViewControllerNavigationController.h"

#import "ItemsTableViewCell.h"

#import "WebsiteBase.h"

typedef enum : int{
    EnumItemIndex_1 = 0,
    EnumItemIndex_2 = 1,
    
}EnumItemIndex;

@interface ItemsViewController ()
@end



@implementation ItemsViewController


-(instancetype)init{
    self = [super init];
    if( self ){
        [self.view setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        [self cofigureTableview];
        [(ViewControllerNavigationController*) self.navigationController setNavigationBarTiteleUse: EnumTabBarIndexItems];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /* ViewCell */
    // 模擬取得資料
    // 網路端假資料
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < 2; i++ ) {
        ItemsModel *model = [[ItemsModel alloc] init];
        model.bg = [self getCellImageWithIndex:i];
        model.timetitle = [self getCellTimeLabelWithIndex:i];
        model.sel = EnumItemIndex_None;
        model.viewChose = i;
        
        [array addObject:model];
    }
    
    // 觸發 TableView Reload
    self.contentArray = array;
    

}

/* 取得BackgroundColor */
-(UIImage *)getCellImageWithIndex:(NSUInteger)index{
    
    UIImage *tempBg = nil;
    
    switch (index) {
        case EnumItemIndex_1:
            tempBg = [GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"goldCell"];
            break;
        case EnumItemIndex_2:
            tempBg = [GW2BroH_Tools getImageWithString:@"ViewControllerItems" withImageName:@"gemCell"];
            break;
        default:
            NSLog(@"Error");
            break;
    }
    return tempBg;
}

/* 取得BossTitle */
-(NSString *)getCellTimeLabelWithIndex:(NSUInteger)index{
    
    NSString *title = @"";
    
    switch (index) {
        case EnumItemIndex_1:
        case EnumItemIndex_2:
            title = @"time";
            break;
        default:
            NSLog(@"Error");
            break;
    }
    return title;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pressedBtn:(id)sender{
    [(ViewControllerTabBar *)self.tabBarController changeViewControllerWithIndex:EnumTabBarIndexStartMenu];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
