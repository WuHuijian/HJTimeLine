//
//  ViewController.m
//  HJTimeLine
//
//  Created by WHJ on 2017/7/11.
//  Copyright © 2017年 WHJ. All rights reserved.
//

#import "ViewController.h"
#import "HJTimeLineCell.h"
#import "HJTimeLineModel.h"
#import "HJTimeLineHeader.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/** <#describe#> */
@property (nonatomic, strong) NSMutableArray *datas;

@end

static NSString * const kTimeLineCellIdentifier = @"kTimeLineCellIdentifier";

@implementation ViewController

#pragma mark - Life Circle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - About UI
- (void)setupUI{
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor grayColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [tableView registerClass:[HJTimeLineCell class] forCellReuseIdentifier:kTimeLineCellIdentifier];
    [self.view addSubview:tableView];
    self.tableView = tableView;

}

#pragma mark - Request Data

#pragma mark - Event response

#pragma mark - Pravite Method

#pragma mark - Public Method

#pragma mark - Getters/Setters/Lazy
- (NSMutableArray *)datas{
    if (!_datas) {
        _datas = [NSMutableArray array];
        for (int i = 0; i<10; i++) {
            HJTimeLineModel *model = [[HJTimeLineModel alloc] init];
            model.title = [NSString stringWithFormat:@"标题:%zd",i];
            model.subTitle = [NSString stringWithFormat:@"副标题:%zd",i];
            model.timeString = [NSString stringWithFormat:@"%@",[NSDate date]];
            NSInteger showType = i%3;
            model.content = showType==0?@"任务已完成":(showType== 1?@"任务即将开始":@"任务未完成");
            [_datas addObject:model];
        }
    }
    return _datas;
}
#pragma mark - Delegate methods

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HJTimeLineCell *cell = [tableView dequeueReusableCellWithIdentifier:kTimeLineCellIdentifier];
    cell.model = self.datas[indexPath.row];
    NSInteger showType = indexPath.row%3;
   UIColor *color = showType==0?[UIColor greenColor]:(showType== 1?[UIColor purpleColor]:[UIColor orangeColor]);
    cell.circleColor = color;
    cell.showRight = indexPath.row%2==0;
    return cell;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HJTimeLineHeader *header = [[HJTimeLineHeader alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), [HJTimeLineCell cellHeight])];
    header.title = @"%60";
    return header;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [HJTimeLineCell cellHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return [HJTimeLineCell cellHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.001f;
}
@end
