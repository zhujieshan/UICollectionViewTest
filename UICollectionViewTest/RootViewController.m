//
//  RootViewController.m
//  UICollectionViewTest
//
//  Created by yebaojia on 17/6/14.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import "RootViewController.h"
#import "ViewController.h"
#import "ViewController1.h"

@interface RootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong ,nonatomic) UITableView *tableView;
@end

@implementation RootViewController

#pragma mark -- LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Test";
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)dealloc{
    
}

#pragma mark -- RequestNetwork


#pragma mark -- Event


#pragma mark -- Delegate
//分区下有几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

//cell的点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消某行的选中状态
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[[ViewController alloc]init] animated:YES];
    }else{
         [self.navigationController pushViewController:[[ViewController1 alloc]init] animated:YES];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reusepool"];
    NSArray *arr  = @[@"带导航栏",@"隐藏导航栏"];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"reusepool"];
    }
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}

-(UITableView *)tableView{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

#pragma mark -- UI


#pragma mark -- Setter And Getter


#pragma mark -- ReceiveMemoryWarning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
