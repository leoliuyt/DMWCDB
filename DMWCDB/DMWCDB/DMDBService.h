//
//  DMDBService.h
//  DMWCDB
//
//  Created by lbq on 2017/8/31.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import <Foundation/Foundation.h>
@class DMUser;

@interface DMDBService : NSObject

+ (instancetype)shared;

- (BOOL)updateUser:(DMUser *)user;
- (BOOL)deleteUserId:(NSString *)userId;
- (void)insertUsers:(NSArray <DMUser *>*)users;
- (NSArray<DMUser *> *)fetchUsers;
@end
