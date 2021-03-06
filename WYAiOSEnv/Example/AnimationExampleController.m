//
//  AnimationExampleController.m
//  WYAiOSEnv
//
//  Created by 李俊恒 on 2018/7/7.
//  Copyright © 2018年 WeiYiAn. All rights reserved.
//

#import "AnimationExampleController.h"
#import "UITableView+CellAnimation.h"
#define Animation_CELLID @"Animation_CELLID"

@interface AnimationExampleController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) NSArray * dataSources;
@end

@implementation AnimationExampleController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSArray *)dataSources {
    if (_dataSources == nil) {
        _dataSources = @[ @"左侧飞入", @"透明", @"上面掉落", @"抖动动画", @"上下翻转动画", @"从下往上", @"从上往下弹出", @"从下往上挤上顶部", @"左右翻转动画" ];
    }
    return _dataSources;
}
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView            = [[UITableView alloc] initWithFrame:CGRectMake(0, WYATopHeight, ScreenWidth, ScreenHeight)];
        _tableView.delegate   = self;
        _tableView.dataSource = self;

        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Animation_CELLID];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    }
    return _tableView;
}
#pragma mark ======= UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSources.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Animation_CELLID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Animation_CELLID];
    }
    cell.backgroundColor = randomColor;
    cell.textLabel.text  = self.dataSources[indexPath.row];
    return cell;
}
#pragma mark ======= UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            [tableView wya_moveAnimation];
            break;
        case 1:
            [tableView wya_alphaAnimation];
            break;
        case 2:
            [tableView wya_fallAnimation];
            break;
        case 3:
            [tableView wya_shakeAnimation];
            break;
        case 4:
            [tableView wya_overTurnAnimation];
            break;
        case 5:
            [tableView wya_toTopAnimation];
            break;
        case 6:
            [tableView wya_springListAnimation];
            break;
        case 7:
            [tableView wya_shrinkToTopAnimation];
            break;
        case 8:
            [tableView wya_roteAnimation];
            break;
        default:
            break;
    }
}
@end
