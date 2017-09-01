//
//  DMVendor.h
//  DMWCDB
//
//  Created by lbq on 2017/9/1.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "vend_city" : "Anytown",
 "vend_name" : "Bear Emporium",
 "vend_zip" : "44333",
 "vend_country" : "USA",
 "vend_address" : "500 Park Street",
 "vend_id" : "BRE02",
 "vend_state" : "OH"
 */
@interface DMVendor : NSObject

@property (nonatomic, copy) NSString *vend_id;
@property (nonatomic, copy) NSString *vend_name;
@property (nonatomic, copy) NSString *vend_city;
@property (nonatomic, copy) NSString *vend_zip;
@property (nonatomic, copy) NSString *vend_country;
@property (nonatomic, copy) NSString *vend_address;
@property (nonatomic, copy) NSString *vend_state;

@end
