//
//  DMUser.m
//  DMWCDB
//
//  Created by lbq on 2017/8/31.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "DMUser.h"
#import <YYModel.h>
#import <WCDB.h>

@implementation DMUser

WCDB_IMPLEMENTATION(DMUser)
WCDB_SYNTHESIZE(DMUser, userid)
WCDB_SYNTHESIZE(DMUser, nickname)
WCDB_SYNTHESIZE(DMUser, icon)
WCDB_SYNTHESIZE(DMUser, gender)

WCDB_PRIMARY(DMUser, userid)

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"userid"  : @"_id",
             };
}

@end
