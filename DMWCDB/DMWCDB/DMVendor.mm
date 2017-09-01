//
//  DMVendor.m
//  DMWCDB
//
//  Created by lbq on 2017/9/1.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "DMVendor.h"
#import <WCDB.h>

@implementation DMVendor

WCDB_IMPLEMENTATION(DMVendor)
WCDB_SYNTHESIZE(DMVendor, vend_id)
WCDB_SYNTHESIZE(DMVendor, vend_name)
WCDB_SYNTHESIZE(DMVendor, vend_city)
WCDB_SYNTHESIZE(DMVendor, vend_zip)
WCDB_SYNTHESIZE(DMVendor, vend_country)
WCDB_SYNTHESIZE(DMVendor, vend_address)
WCDB_SYNTHESIZE(DMVendor, vend_state)

WCDB_PRIMARY(DMVendor, vend_id)

@end
