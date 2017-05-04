//
//  Person.m
//  JBChineseSort
//
//  Created by ru on 2017/5/4.
//  Copyright © 2017年 GMJK. All rights reserved.
//

#import "Person.h"

@implementation Person


+ (NSArray *)getRandomArray {
    
    NSMutableArray *arrm = [NSMutableArray array];
    
    NSArray *arrOne = @[@"赵",@"钱",@"孙",@"李",@"周",@"吴",@"郑",@"王",@"冯",@"陈",@"楚",@"魏",@"将",@"茹",@"韩",@"张"];
    NSArray *arrTwo = @[@"斌",@"伟",@"求",@"善",@"丽",@"红",@"明",@"累",@"泪",@"雷",@"亮",@"合"];
    
    
    for (NSInteger i = 0; i < 40; i++) {
        
        
        NSInteger num = arc4random_uniform(arrOne.count);
        
        NSInteger numOne  = arc4random_uniform(arrTwo.count);
        
        NSInteger numTwo  = arc4random_uniform(arrTwo.count);
        
        NSString *str = [NSString stringWithFormat:@"%@%@%@",arrOne[num],arrTwo[numOne],arrTwo[numTwo]];
        
        Person *p  = [Person new];
        
        p.name = str;
        
        [arrm addObject:p];
        
        
    }
    
    
    
    
    
    
    
    return arrm.copy;
    
    
}

@end
