//
//  ViewController.m
//  JBChineseSort
//
//  Created by ru on 2017/5/4.
//  Copyright © 2017年 GMJK. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"



@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@property (nonatomic, strong) NSArray<Person *> *modelList;

@property (nonatomic, strong) NSMutableArray *titleArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"中文排序";
    
   
    [self.view addSubview:self.tableView];
    
    
    //设置
    
    
}


- (void)setupSoureData {
    
    
    
    
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 10;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = @"11";
    
    return cell;
    
}


- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsVerticalScrollIndicator = NO;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    
    return _tableView;
    
}

- (NSArray<Person *> *)modelList {
    
    
    if (!_modelList) {
        _modelList = [Person getRandomArray];
    }
    
    return _modelList;
    
}

- (NSMutableArray *)titleArr {
    
    if (!_titleArr) {
        _titleArr = [NSMutableArray array];
    }
    
    return _titleArr;
}



@end
