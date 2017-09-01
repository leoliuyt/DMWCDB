//
//  DMDBService.h
//  DMWCDB
//
//  Created by lbq on 2017/8/31.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DMUser,DMProduct,DMVendor;

@interface DMDBService : NSObject

+ (instancetype)shared;

- (BOOL)updateUser:(DMUser *)user;
- (BOOL)deleteUserId:(NSString *)userId;
- (void)insertUsers:(NSArray <DMUser *>*)users;
- (void)insertVendors:(NSArray<DMVendor *>*)vendors;
- (void)insertProducts:(NSArray<DMProduct *>*)products;

- (NSArray<DMUser *> *)fetchUsers;
@end
