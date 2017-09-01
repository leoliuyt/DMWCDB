//
//  ViewController.m
//  DMWCDB
//
//  Created by lbq on 2017/8/31.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import "ViewController.h"
#import "DMUser.h"
#import <YYModel.h>
#import "DMDBService.h"
#import "DMProduct.h"
#import "DMVendor.h"


@interface ViewController ()

@property (nonatomic, copy) NSArray<DMUser *> *users;
@property (nonatomic, copy) NSArray<DMProduct *> *products;
@property (nonatomic, copy) NSArray<DMVendor *> *vendors;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createAction:(id)sender {
    [DMDBService shared];
}
- (IBAction)addAction:(id)sender {
    [[DMDBService shared] insertUsers:self.users];
    [[DMDBService shared] insertVendors:self.vendors];
    [[DMDBService shared] insertProducts:self.products];
}

- (IBAction)delete:(id)sender {
    BOOL opSuccess = [[DMDBService shared] deleteUserId:@"59883af84df8e432659e3954"];
    if (opSuccess) {
        NSLog(@"删除操作成功");
    } else {
        NSLog(@"删除操作失败");
    }
}

- (IBAction)updateAction:(id)sender {
    DMUser *user = [[DMUser alloc] init];
    user.userid = @"59883af84df8e432659e3954";
    user.icon = @"aaaaa";
   BOOL opSuccess = [[DMDBService shared] updateUser:user];
    if (opSuccess) {
        NSLog(@"更新操作成功");
    } else {
        NSLog(@"更新操作失败");
    }
}

- (IBAction)selectAction:(id)sender {
    NSArray *arr = [[DMDBService shared] fetchUsers];
    NSLog(@"%@",arr);
}

- (void)loadData
{
    NSString *file = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:file];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"%@",error.localizedDescription);
        return;
    }
    
    
    NSArray<NSDictionary *> *arr = dic[@"users"];
    NSMutableArray *tmp = [NSMutableArray arrayWithCapacity:arr.count];
    [arr enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DMUser *user = [DMUser yy_modelWithDictionary:obj];
        [tmp addObject:user];
    }];
    self.users = [tmp copy];
    
    
    NSString *fileV = [[NSBundle mainBundle] pathForResource:@"Vendors" ofType:@"json"];
    NSData *dataV = [NSData dataWithContentsOfFile:fileV];
    NSError *errorV;
    NSArray<NSDictionary *> *arrV = [NSJSONSerialization JSONObjectWithData:dataV options:NSJSONReadingMutableContainers error:&errorV];
    if (errorV) {
        NSLog(@"%@",errorV.localizedDescription);
        return;
    }
    [tmp removeAllObjects];
    [arrV enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DMVendor *p = [DMVendor yy_modelWithDictionary:obj];
        [tmp addObject:p];
    }];
    self.vendors = [tmp copy];

    NSString *fileP = [[NSBundle mainBundle] pathForResource:@"Products" ofType:@"json"];
    NSData *dataP = [NSData dataWithContentsOfFile:fileP];
    NSError *errorP;
    NSArray<NSDictionary *> *arrP = [NSJSONSerialization JSONObjectWithData:dataP options:NSJSONReadingMutableContainers error:&errorP];
    if (errorP) {
        NSLog(@"%@",errorP.localizedDescription);
        return;
    }
    
    [tmp removeAllObjects];
    [arrP enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DMProduct *p = [DMProduct yy_modelWithDictionary:obj];
        [tmp addObject:p];
    }];
    self.products = [tmp copy];
}
@end
