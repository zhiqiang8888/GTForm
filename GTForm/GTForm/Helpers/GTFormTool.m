//
//  GTFormTool.m
//  GTForm
//
//  Created by liuxc on 2018/5/17.
//  Copyright © 2018年 liuxc. All rights reserved.
//

#import "GTFormTool.h"

#define GTUserDefault [NSUserDefaults standardUserDefaults]

@implementation GTFormTool

+ (id)objectForKey:(NSString *)key {
    return [GTUserDefault objectForKey:key];
}

+ (void)setObject:(id)value forKey:(NSString *)key {
    [GTUserDefault setObject:value forKey:key];
    [GTUserDefault synchronize];
}

+ (BOOL)boolForKey:(NSString *)key {
    return [GTUserDefault boolForKey:key];
}

+ (void)setBool:(BOOL)value forKey:(NSString *)key {
    [GTUserDefault setBool:value forKey:key];
    [GTUserDefault synchronize];
}

@end
