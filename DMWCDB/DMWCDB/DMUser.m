//
//  DMUser.m
//  DMWCDB
//
//  Created by lbq on 2017/8/31.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "DMUser.h"
#import <YYModel.h>

@implementation DMUser

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userid"  : @"_id",
             };
}

@end
