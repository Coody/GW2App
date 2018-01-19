//
//  WorldBossViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/18.
//  Copyright © 2018年 min_liu. All rights reserved.
//

#import "WorldBossViewController.h"
#import "Constants.h"
#import "GW2BroH_Tools.h"
#import "ViewControllerNavigationController.h"

@interface WorldBossViewController () <UITableViewDelegate ,UITableViewDataSource>
@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray     *content;

@end

@implementation WorldBossViewController
/* TableViewDataSource */
/* 將資料填入TabView */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    
    /* 給定識別儲存格不在,會以識別子建立儲存格 */
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        //cell右側按鍵
        cell.showsReorderControl = NO;
        //cell右側圖示
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.contentMode = UIViewContentModeCenter;
        
    }
    cell.textLabel.backgroundColor = [UIColor orangeColor];
    
    /* 貼底圖 */
    UIImage *icon;
    if(indexPath.row)
    {
        icon = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Blue"];
    }
    else
    {
        icon = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Red"];
    }
    CGSize itemSize = CGSizeMake(220, 900);
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);
    CGRect imageRect = CGRectMake(0, 0, 220, 900);
    [icon drawInRect:imageRect];
    //float ii = cell.contentView.frame.size.height;
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    cell.textLabel.text = [_content objectAtIndex:indexPath.row];
    
    
    return cell;
}
/* 每個區段多少資料 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;//self.content.count;
}
/* 多少個區段資料 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = VC_START_MENU_BACKGROUND_COLOR;
    //self.navigationBar.backgroundColor = VC_NAVIGATION_BAR_COLOR;
    //self.navigationItem.backBarButtonItem = VC_NAVIGATION_BAR_COLOR;
    
    self.title = @"世界王";
    
    /* 顯示label */
    UILabel *myLabel2 = [[UILabel alloc] init];
    CGRect labelFrame = CGRectMake(120.0f, 25.0f, 180.0f, 23.0f);
    myLabel2  = [[UILabel alloc]initWithFrame:labelFrame];
    myLabel2.text = @"page1";
    myLabel2.font = [UIFont boldSystemFontOfSize:14.0f];
    [self.view addSubview:myLabel2];
    
    /* ViewCell */
    [self cofigureTableview];
    //self.content = @[ @"Monday", @"Tuesday", @"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"];
    self.content = @[ @"1", @"2", @"3",@"4"];
}

-(void)cofigureTableview
{
    
    //self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 250, 350) style:UITableViewStyleGrouped];
    self.table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    
    self.table.backgroundColor = [UIColor orangeColor];
    //self.table.separatorStyle = UITableViewCellSeparatorStyleNone;//無cell線條
    
    self.table.delegate = self;
    self.table.dataSource = self;
    
    CGRect frame = self.view.frame;
    /* 取得NavigationBar高 */
    ViewControllerNavigationController *navBar = [[ViewControllerNavigationController alloc] init];
    frame.origin.y += navBar.toolbar.intrinsicContentSize.height;//50;
    self.table.frame = frame;
    
    
    /* 設定Cell高 */
    UIImage *image = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Red"];
    UIImageView *imageview = [[UIImageView alloc] initWithImage:image];
    self.table.rowHeight = imageview.frame.size.height;

    //self.table.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self.view addSubview:self.table];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/* TableViewDelegate */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    NSLog(@"title of cell %@", [_content objectAtIndex:indexPath.row]);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
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
