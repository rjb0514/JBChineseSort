//
//  Person.h
//  JBChineseSort
//
//  Created by ru on 2017/5/4.
//  Copyright © 2017年 GMJK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject


@property (nonatomic, copy) NSString *name;


/** 获取个随机数组 */
+ (NSArray *)getRandomArray;


@end
