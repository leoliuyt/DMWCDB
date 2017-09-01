//
//  DMProduct+WCTTableCoding.h
//  DMWCDB
//
//  Created by lbq on 2017/9/1.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "DMProduct.h"
#import <WCDB/WCDB.h>

@interface DMProduct (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(prod_id)
WCDB_PROPERTY(vend_id)
WCDB_PROPERTY(prod_name)
WCDB_PROPERTY(prod_desc)
WCDB_PROPERTY(prod_price)

@end
