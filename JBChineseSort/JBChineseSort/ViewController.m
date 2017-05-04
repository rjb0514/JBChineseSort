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


@property (nonatomic, strong) NSArray *modelList;

@property (nonatomic, strong) NSMutableArray *titleArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"中文排序";
    
   
    [self.view addSubview:self.tableView];
    
    
    //设置
    
    [self setupSoureData];
    
}


//数据的处理
- (void)setupSoureData {
    
    
    //获取随机的姓名数组
    NSArray *arr = [Person getRandomArray];
    
    
    //创建localized对象
    UILocalizedIndexedCollation *localized =  [UILocalizedIndexedCollation currentCollation];
    
    
    NSMutableArray *newSectionArr = [NSMutableArray array];
    
    NSInteger num = [[localized sectionTitles] count];
    
    //创建二维数组
    for (NSInteger i = 0; i < num; i++) {
        [newSectionArr addObject:[NSMutableArray array]];
    }
    
    
    for (Person *p in arr) {
        NSInteger sectionInteger = [localized sectionForObject:p collationStringSelector:@selector(name)];
        
        //把对应的名字添加到二维数组
        [newSectionArr[sectionInteger] addObject:p];
    }
    
    
    //二维数组排序
    
    for (NSInteger i = 0; i < newSectionArr.count; i ++) {
        
        NSMutableArray *arrM = newSectionArr[i];
        
        //排序函数
        NSArray *temparr = [localized sortedArrayFromArray:arrM collationStringSelector:@selector(name)];
        
        
        newSectionArr[i] = temparr.mutableCopy;
        
    }
    
    
    NSMutableArray *deleteArr = [NSMutableArray array];
    
    [newSectionArr enumerateObjectsUsingBlock:^(NSMutableArray *obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        
        if (obj.count) {
            
            [self.titleArr addObject:[localized sectionTitles][idx]];
            
            
        }else {
            
            [deleteArr addObject:obj];
        }
        
    }];
    
    [newSectionArr removeObjectsInArray:deleteArr];
    
    self.modelList = newSectionArr;
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return self.titleArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.modelList[section] count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    Person *p = self.modelList[indexPath.section][indexPath.row];
    cell.textLabel.text = p.name;
    
    return cell;
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    return self.titleArr[section];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    return self.titleArr;
    
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

- (NSArray *)modelList {
    
    
    if (!_modelList) {
        _modelList = [NSMutableArray array];
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
