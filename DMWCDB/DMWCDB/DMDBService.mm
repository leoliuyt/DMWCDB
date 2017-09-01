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

#define kUserTable @"usertable"

@interface DMDBService()

@property (nonatomic, strong) WCTDatabase *database;

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
    self.database = [[WCTDatabase alloc] initWithPath:filePath];
    /*
     CREATE TABLE messsage (localID INTEGER PRIMARY KEY,
     content TEXT,
     createTime BLOB,
     modifiedTime BLOB)
     */
    BOOL result = [self.database createTableAndIndexesOfName:kUserTable
                                              withClass:DMUser.class];
    return self;
}

- (void)insertUsers:(NSArray <DMUser *>*)users
{
    [self.database deleteAllObjectsFromTable:kUserTable];
    [users enumerateObjectsUsingBlock:^(DMUser * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self.database insertObject:obj into:kUserTable];
    }];
}

- (BOOL)deleteUserId:(NSString *)userId
{
    return [self.database deleteObjectsFromTable:kUserTable where:DMUser.userid == userId];
}

- (BOOL)updateUser:(DMUser *)user
{
    return [self.database updateRowsInTable:kUserTable onProperty:DMUser.icon withValue:user.icon where:DMUser.userid == user.userid];
}

- (NSArray<DMUser *> *)fetchUsers
{
//    NSArray<Message *> *message = [database getObjectsOfClass:Message.class
//                                                    fromTable:@"message"
//                                                      orderBy:Message.localID.order()];
    NSArray<DMUser *>*arr = [self.database getObjectsOfClass:DMUser.class fromTable:kUserTable orderBy:DMUser.userid.order()];
    return arr;
}
@end
