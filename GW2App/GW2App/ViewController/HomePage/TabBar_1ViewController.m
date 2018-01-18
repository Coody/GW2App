//
//  TabBar_1ViewController.m
//  GW2App
//
//  Created by min_liu on 2018/1/12.
//  Copyright © 2018年 min_liu. All rights reserved.
//
#import "Constants.h"
#import "TabBar_1ViewController.h"
#import "GW2BroH_Tools.h"

@interface TabBar_1ViewController () <UITableViewDelegate ,UITableViewDataSource>
@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray     *content;


@end

@implementation TabBar_1ViewController
/* TableViewDataSource */
/* 將資料填入TabView */
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //進七次
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    
    /* 給定識別儲存格不在,會以識別子建立儲存格 */
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text =  [_content objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"bounty"];
    
    
    
    UIImage *icon = [GW2BroH_Tools getImageWithString:@"ViewControllerWorldBoss" withImageName:@"CellBackgroundImage_Red"];
    CGSize itemSize = CGSizeMake(300, 400);//固定图片大小为36*36 icon.size;//
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);//*1
    CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
    [icon drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();//*2
    UIGraphicsEndImageContext();
    
//    UIImage *test = [GW2BroH_Tools getImageWithString:@"ViewControllerGuild" withImageName:@"bounty"];
//    UIImageView *imageview = [[UIImageView alloc] initWithImage:test];
//    imageview.center = CGPointMake(150, 300);
//    [self.view addSubview:imageview];

    return cell;
}
/* 每個區段多少資料 */
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //進三次
    return self.content.count;
}
/* 多少個區段資料 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //進三次
    return 1;//1;
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
    
//    UIButton *btn ;//= [[UIButton alloc] init];
//    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    btn.frame = CGRectMake(0, 0, 150, 70);
//    btn.center = CGPointMake(160, 120);
//    btn.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//    [btn setTitle:@"Change to Fourth" forState:UIControlStateNormal];
//    //[btn addTarget:self action:@selector(changToFourthTab) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];

    /* ViewCell */
    [self cofigureTableview];
    self.content = @[ @"Monday", @"Tuesday", @"Wednesday",@"Thursday",@"Friday",@"Saturday",@"Sunday"];
    
    
}

-(void)cofigureTableview
{
    
    //self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    //self.table = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 250, 350) style:UITableViewStyleGrouped];
    
    self.table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    self.table.delegate = self;
    self.table.dataSource = self;
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
