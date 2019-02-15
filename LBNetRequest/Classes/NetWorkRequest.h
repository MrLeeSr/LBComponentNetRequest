//
//  NetWorkRequest.h
//  test1.2cookBook掌厨
//
//  Created by qf on 15/10/8.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIColor+LYAdd.h"
typedef void(^SuccessBlock)(id data);
typedef void(^FailBlock)(NSString * errorDes);
@interface NetWorkRequest : NSObject

//请求主页表格视图数据
+ (void)getCellDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithPage:(int)page andCityName:(NSString *)cityName;

//请求主页商品详情数据
+ (void)getGoodsDetailInformationSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithCityName:(NSString *)cityName andGoodsId:(NSInteger)goodsID;

//请求分类界面数据
+ (void)getClassDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock;

//请求商品分类详情界面分类信息
+ (void)getSortDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock;

//请求分类商品界面货物列表数据
+ (void)getDetailClassDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithCategoryId:(NSInteger)categoryId andPage:(int)page;

//请求评论数据
+ (void)getCommentDataSuccess:(SuccessBlock)successBloclk fail:(FailBlock)failBlock WithShopID:(NSString *)shopID andPage:(int)page;

//请求下厨界面ad数据
+ (void)getCookADDataSuccess:(SuccessBlock)successBolck fail:(FailBlock)failBlock;

//请求店铺信息数据
+ (void)getShopInfoDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withShopID:(NSString *)shopID;

//请求店铺菜单列表数据
+ (void)getShopMenuDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithPage:(int)page andShopID:(NSString *)shopID andCity:(NSString *)city andCategory:(int)category;

//请求店铺菜单店铺信息数据
+ (void)getMenuShopInfoDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithShopID:(NSString *)shopID andCity:(NSString *)city;

//登录
+ (void)loginSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withPhoneNumber:(NSString *)phoneNumber andPassWord:(NSString *)passWord;

//注册
+ (void)registerSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withPhoneNumber:(NSString *)phoneNumber;

//注册确认
+ (void)canRegisterSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withCaptcha:(NSString *)captcha andToken:(NSString *)token;

//退出登录
+ (void)exitLoginSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock;

//忘记密码
+ (void)forgetPassWordSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock;

//验证是否注册
+ (void)testIsLogonOrNotSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withPhoneNumber:(NSString *)phoneNumber;

//修改密码发送短信验证码
+ (void)sendCaptchaSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithPhoneNumber:(NSString *)phoneNumber andCaptcha:(NSString *)captcha andToken:(NSString *)token;

//找回密码确认
+ (void)confirmGetPassWordSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withCaptcha:(NSString *)captcha withToken:(NSString *)token;

//设置用户信息确认
+ (void)setMyPasswordSuccess:(SuccessBlock)success Fail:(FailBlock)fail passWord:(NSString *)passWord andSex:(NSString *)sex andNickName:(NSString *)name andToken:(NSString *)token;

//修改密码
+ (void)changePassWordSuccess:(SuccessBlock)success Fail:(FailBlock)fail PassWord:(NSString *)passWord andToken:(NSString *)token;

//搜索
+ (void)searchSuccess:(SuccessBlock)success Fail:(FailBlock)fail withSearchKeyWords:(NSString *)keyWords andPage:(int)page andCityName:(NSString *)cityName;
@end
