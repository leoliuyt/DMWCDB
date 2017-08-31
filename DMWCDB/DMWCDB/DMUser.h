//
//  DMUser.h
//  DMWCDB
//
//  Created by lbq on 2017/8/31.
//  Copyright © 2017年 lbq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMUser : NSObject

@property (nonatomic, strong) NSString* userid;                 //用户ID
@property (nonatomic, strong) NSString* nickname;               //昵称
@property (nonatomic, strong) NSString* password;               //密码
@property (nonatomic, strong) NSString* icon;                   //头像
@property (nonatomic, strong) NSNumber* gender;                 //1男 2女
@property (nonatomic, strong) NSString* direction;              //主设计
@property (nonatomic, strong) NSString* directionid;            //主设计id
@property (nonatomic, strong) NSArray* dirtags;                 //擅长设计
@property (nonatomic, strong) NSArray* dirtagsids;              //擅长设计id
@property (nonatomic, strong) NSNumber* prepricepercent;        //可以支付初稿费的比例。例如 30 代表 30%
@property (nonatomic, strong) NSString* email;                  //邮箱
@property (nonatomic, strong) NSString* mobile;                 //手机号
@property (nonatomic, strong) NSString* worktime;               //工作年限
@property (nonatomic, strong) NSString* worktimeid;             //工作年限id
@property (nonatomic, strong) NSString* workplace;              //工作地区
@property (nonatomic, strong) NSString* workplaceid;            //工作地区id
@property (nonatomic, strong) NSString* signature;              //个人签名

@property (nonatomic, strong) NSString* workunit;               //工作单位
@property (nonatomic, strong) NSString* graduation_school;      //毕业院校
@property (nonatomic, strong) NSString* graduation_schoolid;    //毕业院校id
@property (nonatomic, strong) NSString* graduation_provinces;   //毕业院校所在省份
@property (nonatomic, strong) NSString* graduation_provincesid; //院校所属省份id
@property (nonatomic, strong) NSString* sdesc;                  //个人优势
@property (nonatomic, strong) NSString* designdesc;             //设计号的介绍
@property (nonatomic, strong) NSString* desc;                   //详细介绍


@property (nonatomic, strong) NSNumber* rltype;                 //1-互相关注,2-已关注,3-对方关注我,4-为本人（以后可能用于用户列表）,5-没有关系
@property (nonatomic, strong) NSNumber* ischeck;                //用户V属性
@property (nonatomic, strong) NSNumber* rank;                   //用户排行
@property (nonatomic, strong) NSNumber* isgov;                  //用户“官”属性
@property (nonatomic, strong) NSNumber* level;                  //用户星级

@property (nonatomic, strong) NSString* easemobuser;            //环信用户
@property (nonatomic, strong) NSString* number;                 //ID


@end
