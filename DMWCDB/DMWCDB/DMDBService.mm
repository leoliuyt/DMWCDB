//
//  DMDBService.m
//  DMWCDB
//
//  Created by lbq on 2017/8/31.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "DMDBService.h"
#import <WCDB.h>
#import "DMUser.h"
#import "DMUser+WCTTableCoding.h"

#import "DMVendor.h"
#import "DMVendor+WCTTableCoding.h"

#import "DMProduct.h"
#import "DMProduct+WCTTableCoding.h"

#define kUserTable @"usertable"
#define kVendorTable @"vendortable"
#define kProductTable @"producttable"

@interface DMDBService()

@property (nonatomic, strong) WCTTable *userTable;
@property (nonatomic, strong) WCTTable *vendorTable;
@property (nonatomic, strong) WCTTable *productTable;

@end
@implementation DMDBService

+ (instancetype)shared
{
    static DMDBService *instance;
    static dispatch_once_t time;
    dispatch_once(&time, ^{
        instance = [[DMDBService alloc] init];
    });
    return instance;
}
- (instancetype)init
{
    self = [super init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [paths objectAtIndex:0];
    filePath = [filePath stringByAppendingPathComponent:@"dmdb.db"];
    WCTDatabase *database = [[WCTDatabase alloc] initWithPath:filePath];
    /*
     CREATE TABLE messsage (localID INTEGER PRIMARY KEY,
     content TEXT,
     createTime BLOB,
     modifiedTime BLOB)
     */
    BOOL result = [database createTableAndIndexesOfName:kUserTable
                                              withClass:DMUser.class];
    if (result) {
        self.userTable = [database getTableOfName:kUserTable withClass:DMUser.class];
    }
    BOOL resultVendor = [database createTableAndIndexesOfName:kVendorTable
                                                   withClass:DMVendor.class];
    if (resultVendor) {
        self.vendorTable = [database getTableOfName:kVendorTable withClass:DMVendor.class];
    }
    BOOL resultProduct = [database createTableAndIndexesOfName:kProductTable
                                                   withClass:DMProduct.class];
    if (resultProduct) {
        self.productTable = [database getTableOfName:kProductTable withClass:DMProduct.class];
    }
    return self;
}

- (void)insertUsers:(NSArray <DMUser *>*)users
{
    [self.userTable deleteAllObjects];
    [users enumerateObjectsUsingBlock:^(DMUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.userTable insertObject:obj];
    }];
}

- (void)insertProducts:(NSArray<DMProduct *>*)products
{
    [self.productTable deleteAllObjects];
    [products enumerateObjectsUsingBlock:^(DMProduct * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.productTable insertObject:obj];
    }];
}

- (void)insertVendors:(NSArray<DMVendor *>*)vendors
{
    [self.vendorTable deleteAllObjects];
    [vendors enumerateObjectsUsingBlock:^(DMVendor * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.vendorTable insertObject:obj];
    }];
}


- (BOOL)deleteUserId:(NSString *)userId
{
    return [self.userTable deleteObjectsWhere:DMUser.userid == userId];
}

- (BOOL)updateUser:(DMUser *)user
{
    return [self.userTable updateRowsOnProperty:DMUser.icon withValue:user.icon where:DMUser.userid == user.userid];
}

- (NSArray<DMUser *> *)fetchUsers
{
    NSArray <DMUser *> *arr = [self.userTable getObjectsOrderBy:DMUser.userid.order() limit:5];
    return arr;
}
@end
