//
//  DMProduct.m
//  DMWCDB
//
//  Created by lbq on 2017/9/1.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "DMProduct.h"
#import <WCDB.h>

@implementation DMProduct

WCDB_IMPLEMENTATION(DMProduct)
WCDB_SYNTHESIZE(DMProduct, prod_id)
WCDB_SYNTHESIZE(DMProduct, vend_id)
WCDB_SYNTHESIZE(DMProduct, prod_name)
WCDB_SYNTHESIZE(DMProduct, prod_desc)
WCDB_SYNTHESIZE(DMProduct, prod_price)

WCDB_PRIMARY(DMProduct, prod_id)

@end
