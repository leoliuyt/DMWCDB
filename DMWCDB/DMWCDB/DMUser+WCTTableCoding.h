//
//  DMUser+WCTTableCoding.h
//  DMWCDB
//
//  Created by lbq on 2017/8/31.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "DMUser.h"
#import <WCDB/WCDB.h>

@interface DMUser (WCTTableCoding) <WCTTableCoding>

WCDB_PROPERTY(userid)
WCDB_PROPERTY(nickname)
WCDB_PROPERTY(icon)
WCDB_PROPERTY(gender)

@end
