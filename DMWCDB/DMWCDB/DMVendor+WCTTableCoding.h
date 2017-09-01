//
//  DMVendor+WCTTableCoding.h
//  DMWCDB
//
//  Created by lbq on 2017/9/1.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "DMVendor.h"
#import <WCDB/WCDB.h>

@interface DMVendor (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(vend_id)
WCDB_PROPERTY(vend_name)
WCDB_PROPERTY(vend_city)
WCDB_PROPERTY(vend_zip)
WCDB_PROPERTY(vend_country)
WCDB_PROPERTY(vend_address)
WCDB_PROPERTY(vend_state)

@end
