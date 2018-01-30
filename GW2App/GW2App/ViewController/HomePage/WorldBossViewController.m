//
//  WorldBossViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/18.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WorldBossViewController.h"
#import "WorldBossViewController+TableView.h"
#import "ViewControllerNavigationController.h"

// for TabBar
#import "ViewControllerTabBar.h"
// for Constant
#import "Constants.h"
//#import "TableViewCell.h"
#import "WorldBossTableViewCell.h"

// for Tools
#import "GW2BroH_Tools.h"

typedef enum : int{
    EnumBossIndex_1 = 0,
    EnumBossIndex_2 = 1,
    EnumBossIndex_3 = 2,
    EnumBossIndex_4 = 3,
    EnumBossIndex_5 = 4,
    EnumBossIndex_6 = 5,
    EnumBossIndex_7 = 6,
    EnumBossIndex_8 = 7,
    EnumBossIndex_9 = 8,
}EnumBossIndex;


@interface WorldBossViewController ()
@end

@implementation WorldBossViewController

-(instancetype)init{
    self = [super init];
    if( self ){
        
        [self.view setBackgroundColor:VC_OTHERS_BACKGROUND_COLOR];
        [self cofigureTableview];
        [(ViewControllerNavigationController*) self.navigationController setNavigationBarTiteleUse: EnumTabBarIndexWorldBoss];
        
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
    for (int i = 0 ; i < 9; i++ ) {
        WorldBossModel *model = [[WorldBossModel alloc] init];
        model.bg = [self getCellImageWithIndex:i];
        model.bossImage = [self getCellBossImageWithIndex:i];
        model.title = [self getCellBossStringWithIndex:i];
        model.isSelected = NO;
        [array addObject:model];
    }
    
    // 觸發 TableView Reload
    self.contentArray = array;
    
}

-(void)setContent:(NSArray *)content{
    _contentArray = content;
    [self.worldBossTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/* 取得BackgroundColor */
-(UIImage *)getCellImageWithIndex:(NSUInteger)index{
    
    UIImage *tempBg = nil;
    switch (index) {
        case EnumBossIndex_1:
            tempBg = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Red"];
            break;
        case EnumBossIndex_2:
        case EnumBossIndex_3:
        case EnumBossIndex_4:
        case EnumBossIndex_5:
        case EnumBossIndex_6:
        case EnumBossIndex_7:
        case EnumBossIndex_8:
        case EnumBossIndex_9:
            tempBg = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_blue"];
        break;
    }
    return tempBg;
}

/* 取得BossImage */
-(UIImage *)getCellBossImageWithIndex:(NSUInteger)index{
    
    UIImage *boss = nil;
    
    switch (index) {
        case EnumBossIndex_1:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"teq"];
            break;
        case EnumBossIndex_2:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"jungleWurm"];
            break;
        case EnumBossIndex_3:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"modniirUlgoth"];
            break;
        case EnumBossIndex_4:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"clawOfJormag"];
            break;
        case EnumBossIndex_5:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"svanirShaman"];
            break;
        case EnumBossIndex_6:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"golemMarkII"];
            break;
        case EnumBossIndex_7:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"evolvedJungleWurm"];
            break;
        case EnumBossIndex_8:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"theShatterer"];
            break;
        case EnumBossIndex_9:
            boss = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"shadowBehemoth"];
            break;
        default:
            break;
    }
    return boss;
}

/* 取得BossTitle */
-(NSString *)getCellBossStringWithIndex:(NSUInteger)index{
    
    NSString *title = @"";
    
    switch (index) {
        case EnumBossIndex_1:
            title = @"屍龍";
            break;
        case EnumBossIndex_2:
            title = @"蟲王";
            break;
        case EnumBossIndex_3:
            title = @"人馬王";
            break;
        case EnumBossIndex_4:
            title = @"冰龍";
            break;
        case EnumBossIndex_5:
            title = @"冰薩滿";
            break;
        case EnumBossIndex_6:
            title = @"高倫王";
            break;
        case EnumBossIndex_7:
            title = @"三蟲王";
            break;
        case EnumBossIndex_8:
            title = @"水晶龍";
            break;
        case EnumBossIndex_9:
            title = @"沼澤王";
            break;
        default:
            break;
    }
    return title;
}

@end
