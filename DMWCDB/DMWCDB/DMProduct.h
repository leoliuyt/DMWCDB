//
//  DMProduct.h
//  DMWCDB
//
//  Created by lbq on 2017/9/1.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
"prod_desc" : "8 inch teddy bear, comes with cap and jacket",
"prod_price" : "5.99",
"prod_id" : "BR01",
"vend_id" : "BRS01",
"prod_name" : "8 inch teddy bear"
*/
@interface DMProduct : NSObject

@property (nonatomic, copy) NSString *prod_id;
@property (nonatomic, copy) NSString *vend_id;
@property (nonatomic, copy) NSString *prod_name;
@property (nonatomic, copy) NSString *prod_desc;
@property (nonatomic, copy) NSString *prod_price;

@end
