//
//  NetWorkRequest.m
//  test1.2cookBook掌厨
//
//  Created by qf on 15/10/8.
//  Copyright (c) 2015年 qf. All rights reserved.
//

#import "NetWorkRequest.h"

@implementation NetWorkRequest

//请求主页表格视图数据
+ (void)getCellDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithPage:(int)page andCityName:(NSString *)cityName{
    // 把汉字转化成url encoded可以在网上传输的...
    NSString * str = [cityName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlString = [NSString stringWithFormat:@"http://api.mishi.cn/index/goods/home/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=2.0&city=%@&cityCode=020&currentPage=%d&lat=23.1761102941365&lng=113.3406078403697&p-apiv=2.0&pageSize=10&sortKey=140&sortType=1",str,page];
    
    [self startReqestWithUrl:urlString params:nil Success:successBlock fail:failBlock];

}

//请求主页商品详情数据
+ (void)getGoodsDetailInformationSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithCityName:(NSString *)cityName andGoodsId:(NSInteger)goodsID{
    NSString * str = [cityName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * urlString = [NSString stringWithFormat:@"http://api.mishi.cn/goods/%ld/detailShow/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=2.0&city=%@&lat=23.17622440793881&lng=113.3406791925792&p-apiv=2.0",(long)goodsID,str];
    NSLog(@"%@",urlString);
    [self startReqestWithUrl:urlString params:nil Success:successBlock fail:failBlock];
}

//请求分类界面数据
+ (void)getClassDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    NSString * urlString = [NSString stringWithFormat:@"http://api.mishi.cn/categories/foreground/1_3/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=3.0&categoryId=0&p-apiv=3.0&step=-1"];
    [self startReqestWithUrl:urlString params:nil Success:successBlock fail:failBlock];
}

//请求商品分类详情界面分类信息
+ (void)getSortDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    NSString * str = @"http://api.mishi.cn/search/config/flow/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0&p-apiv=1.0";
    [self startReqestWithUrl:str params:nil Success:successBlock fail:failBlock];
}

//请求分类商品界面货物列表数据
+ (void)getDetailClassDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithCategoryId:(NSInteger)categoryId andPage:(int)page{
    // 把汉字转化成url encoded可以在网上传输的
    NSString * cityStr = [@"广州市" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * str = [NSString stringWithFormat:@"http://api.mishi.cn/index/goods/category/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=2.0&categoryId=%ld&city=%@&cityCode=020&currentPage=%d&deliveryKey=-1&deliveryType=-1&filterKey=-1&lat=23.17570953772297&lng=113.3370977114917&p-apiv=2.0&pageSize=10&shopWindowNum=0&sortKey=145&switchType=1",(long)categoryId,cityStr,page];

    [self startReqestWithUrl:str params:nil Success:successBlock fail:failBlock];
    
}

//请求评论数据
+ (void)getCommentDataSuccess:(SuccessBlock)successBloclk fail:(FailBlock)failBlock WithShopID:(NSString *)shopID andPage:(int)page{
    NSString * commentUrlStr = [NSString stringWithFormat:@"http://api.mishi.cn/shop/%@/eva/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0&currentPage=%d&p-apiv=1.0&pageSize=5",shopID,page];
    [self startReqestWithUrl:commentUrlStr params:nil Success:successBloclk fail:failBlock];
}

//请求下厨界面ad数据
+ (void)getCookADDataSuccess:(SuccessBlock)successBolck fail:(FailBlock)failBlock{
    NSString * cookUrlStr = @"http://api.mishi.cn/chef/guide/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=2.0&p-apiv=2.0";
    [self startReqestWithUrl:cookUrlStr params:nil Success:successBolck fail:failBlock];
}

//请求店铺信息数据
+ (void)getShopInfoDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withShopID:(NSString *)shopID{
    NSString * shopUrlStr = [NSString stringWithFormat:@"http://api.mishi.cn/shop/%@/detailShow/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0&p-apiv=1.0",shopID];
    [self startReqestWithUrl:shopUrlStr params:nil Success:successBlock fail:failBlock];
}

//请求店铺菜单列表数据
+ (void)getShopMenuDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithPage:(int)page andShopID:(NSString *)shopID andCity:(NSString *)city andCategory:(int)category{
    NSString * str = [city stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * shopMenuUrlStr = [NSString stringWithFormat:@"http://api.mishi.cn/shop/%@/goods/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0&categoryId=%d&city=%@&cityCode=020&currentPage=%d&lat=23.17645233348288&lng=113.3407365554519&p-apiv=1.0&pageSize=30",shopID,category,str,page];
    [self startReqestWithUrl:shopMenuUrlStr params:nil Success:successBlock fail:failBlock];
}

//请求店铺菜单店铺信息数据
+ (void)getMenuShopInfoDataSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithShopID:(NSString *)shopID andCity:(NSString *)city{
    NSString * str = [city stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * menuShopUrl = [NSString stringWithFormat:@"http://api.mishi.cn/shop/%@/summary/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0&city=%@&lat=23.17635679847934&lng=113.340757374405&p-apiv=1.0",shopID,str];
    [self startReqestWithUrl:menuShopUrl params:nil Success:successBlock fail:failBlock];
}

+ (void)startReqestWithUrl:(NSString *)urlString params:(NSDictionary *)params Success:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
#if 0
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask * dataTask = [session dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        successBlock(dict);
        failBlock(error.localizedDescription);
    }];
    //启动请求
    [dataTask resume];
#else
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //block传值
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        successBlock (dict);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //block传值
        failBlock (error.localizedDescription);
    }];
    
#endif
}

//登录
+ (void)loginSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withPhoneNumber:(NSString *)phoneNumber andPassWord:(NSString *)passWord{
    
    //是否需要加密
    Boolean boollean = false;
    
    NSString * str1 = [NSString stringWithFormat:@"%hhu",boollean];
    NSString * str = @"http://api.mishi.cn/user/login/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0";
    NSDictionary * postDict = @{@"password":passWord,@"p-apiv":@"1.0",@"needEncrypt":str1,@"phoneNumber":phoneNumber};
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];

    //post头
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding" ];
    [manager.requestSerializer setValue:@"zh-Hans;q=1" forHTTPHeaderField:@"Accept-Language" ];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection" ];
    [manager.requestSerializer setValue:@"333"  forHTTPHeaderField:@"Content-Length" ];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8"  forHTTPHeaderField:@"Content-Type" ];
    [manager.requestSerializer setValue:@"api.mishi.cn"  forHTTPHeaderField:@"Host" ];
    [manager.requestSerializer setValue:@"APISDK/1.0 (iOS;8.1.3;iPhone;;iPhone6)"  forHTTPHeaderField:@"User-Agent" ];
    [manager.requestSerializer setValue:@"1.9.1.72"  forHTTPHeaderField:@"p-appv" ];
    [manager.requestSerializer setValue:@"B3CA7544-9702-4C07-9E0F-56BEC305BA1D"  forHTTPHeaderField:@"p-devid" ];
    
    [manager POST:str parameters:postDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock (error.localizedDescription);
    }];

}

//注册
+ (void)registerSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withPhoneNumber:(NSString *)phoneNumber{
    
    NSString * str = @"http://api.mishi.cn/user/register/sendSmsCaptcha/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0";
    NSDictionary * postDict = @{@"p-apiv":@"1.0",@"phoneNumber":phoneNumber};
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    //post头
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding" ];
    [manager.requestSerializer setValue:@"zh-Hans;q=1" forHTTPHeaderField:@"Accept-Language" ];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection" ];
    [manager.requestSerializer setValue:@"333"  forHTTPHeaderField:@"Content-Length" ];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8"  forHTTPHeaderField:@"Content-Type" ];
    [manager.requestSerializer setValue:@"api.mishi.cn"  forHTTPHeaderField:@"Host" ];
    [manager.requestSerializer setValue:@"APISDK/1.0 (iOS;8.1.3;iPhone;;iPhone6)"  forHTTPHeaderField:@"User-Agent" ];
    [manager.requestSerializer setValue:@"1.9.1.72"  forHTTPHeaderField:@"p-appv" ];
    [manager.requestSerializer setValue:@"B3CA7544-9702-4C07-9E0F-56BEC305BA1D"  forHTTPHeaderField:@"p-devid" ];
    
    [manager POST:str parameters:postDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock (error.localizedDescription);
    }];
}

//注册确认
+ (void)canRegisterSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withCaptcha:(NSString *)captcha andToken:(NSString *)token{
    NSString * str = @"http://api.mishi.cn/user/register/validateSmsCaptcha/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0";
    NSDictionary * postDict = @{@"p-apiv":@"1.0",@"captcha":captcha,@"token":token};
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    //post头
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding" ];
    [manager.requestSerializer setValue:@"zh-Hans;q=1" forHTTPHeaderField:@"Accept-Language" ];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection" ];
    [manager.requestSerializer setValue:@"333"  forHTTPHeaderField:@"Content-Length" ];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8"  forHTTPHeaderField:@"Content-Type" ];
    [manager.requestSerializer setValue:@"api.mishi.cn"  forHTTPHeaderField:@"Host" ];
    [manager.requestSerializer setValue:@"APISDK/1.0 (iOS;8.1.3;iPhone;;iPhone6)"  forHTTPHeaderField:@"User-Agent" ];
    [manager.requestSerializer setValue:@"1.9.1.72"  forHTTPHeaderField:@"p-appv" ];
    [manager.requestSerializer setValue:@"5EA88C8C-B958-4450-871A-903E3630D93E"  forHTTPHeaderField:@"p-devid" ];
    
    [manager POST:str parameters:postDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock (error.localizedDescription);
    }];
}

//退出登录
+ (void)exitLoginSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    NSString * str = @"http://api.mishi.cn/user/logout/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0";
    NSDictionary * postDict = @{@"p-apiv":@"1.0"};
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    [manager POST:str parameters:postDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock (error.localizedDescription);
    }];
}

//忘记密码
+ (void)forgetPassWordSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock{
    NSString * forgetPassWordUrlStr = [NSString stringWithFormat:@"http://api.mishi.cn/captcha/getImageCode/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0&p-apiv=1.0"];
    [self startReqestWithUrl:forgetPassWordUrlStr params:nil Success:successBlock fail:failBlock];
}

//验证是否注册
+ (void)testIsLogonOrNotSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withPhoneNumber:(NSString *)phoneNumber{
    NSString * testIsLogonOrNotStr = [NSString stringWithFormat:@"http://api.mishi.cn/user/register/isRegister/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0&p-apiv=1.0&phoneNumber=%@",phoneNumber];
    [self startReqestWithUrl:testIsLogonOrNotStr params:nil Success:successBlock fail:failBlock];
}

//修改密码发送短信验证码
+ (void)sendCaptchaSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock WithPhoneNumber:(NSString *)phoneNumber andCaptcha:(NSString *)captcha andToken:(NSString *)token{
    NSString * str = @"http://api.mishi.cn/captcha/sendSmsCaptcha/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0";
    NSDictionary * postDict = @{@"phoneNumber":phoneNumber,@"p-apiv":@"1.0",@"type":@"2",@"captcha":captcha,@"token":token};
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    //post头
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding" ];
    [manager.requestSerializer setValue:@"zh-Hans;q=1" forHTTPHeaderField:@"Accept-Language" ];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection" ];
    [manager.requestSerializer setValue:@"117"  forHTTPHeaderField:@"Content-Length" ];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8"  forHTTPHeaderField:@"Content-Type" ];
    [manager.requestSerializer setValue:@"api.mishi.cn"  forHTTPHeaderField:@"Host" ];
    [manager.requestSerializer setValue:@"APISDK/1.0 (iOS;8.1.3;iPhone;;iPhone6)"  forHTTPHeaderField:@"User-Agent" ];
    [manager.requestSerializer setValue:@"1.9.0.67"  forHTTPHeaderField:@"p-appv" ];
    [manager.requestSerializer setValue:@"B3CA7544-9702-4C07-9E0F-56BEC305BA1D"  forHTTPHeaderField:@"p-devid" ];
    
    [manager POST:str parameters:postDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock (error.localizedDescription);
    }];

}

//找回密码确认
+ (void)confirmGetPassWordSuccess:(SuccessBlock)successBlock fail:(FailBlock)failBlock withCaptcha:(NSString *)captcha withToken:(NSString *)token{
    NSString * str = @"http://api.mishi.cn/captcha/validateSmsCaptcha/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0";
    NSDictionary * postDict = @{@"p-apiv":@"1.0",@"type":@"2",@"captcha":captcha,@"token":token};
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    //post头
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding" ];
    [manager.requestSerializer setValue:@"zh-Hans;q=1" forHTTPHeaderField:@"Accept-Language" ];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection" ];
    [manager.requestSerializer setValue:@"117"  forHTTPHeaderField:@"Content-Length" ];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8"  forHTTPHeaderField:@"Content-Type" ];
    [manager.requestSerializer setValue:@"api.mishi.cn"  forHTTPHeaderField:@"Host" ];
    [manager.requestSerializer setValue:@"APISDK/1.0 (iOS;8.1.3;iPhone;;iPhone6)"  forHTTPHeaderField:@"User-Agent" ];
    [manager.requestSerializer setValue:@"1.9.0.67"  forHTTPHeaderField:@"p-appv" ];
    [manager.requestSerializer setValue:@"B3CA7544-9702-4C07-9E0F-56BEC305BA1D"  forHTTPHeaderField:@"p-devid" ];
    
    [manager POST:str parameters:postDict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock (error.localizedDescription);
    }];
}

//设置用户信息确认
+ (void)setMyPasswordSuccess:(SuccessBlock)success Fail:(FailBlock)fail passWord:(NSString *)passWord andSex:(NSString *)sex andNickName:(NSString *)name andToken:(NSString *)token{
    NSString * sexStr;
    if ([sex isEqualToString:@"男"]) {
        sexStr = @"1";
    }else{
        sexStr = @"0";
    }
    //是否需要加密
    Boolean boollean = false;
    
    NSString * str1 = [NSString stringWithFormat:@"%hhu",boollean];
    NSDictionary * dict = @{@"password":passWord,@"sex":sexStr,@"p-apiv":@"1.0",@"needEncrypt":str1,@"nickname":name,@"token":token};
    
    NSString *url = [NSString stringWithFormat:@"http://api.mishi.cn/user/register/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //post头
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding" ];
    [manager.requestSerializer setValue:@"zh-Hans;q=1" forHTTPHeaderField:@"Accept-Language" ];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection" ];
    [manager.requestSerializer setValue:@"390"  forHTTPHeaderField:@"Content-Length" ];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8"  forHTTPHeaderField:@"Content-Type" ];
    [manager.requestSerializer setValue:@"api.mishi.cn"  forHTTPHeaderField:@"Host" ];
    [manager.requestSerializer setValue:@"APISDK/1.0 (iOS;8.1.3;iPhone;;iPhone6)"  forHTTPHeaderField:@"User-Agent" ];
    [manager.requestSerializer setValue:@"1.9.0.67"  forHTTPHeaderField:@"p-appv" ];
    [manager.requestSerializer setValue:@"5EA88C8C-B958-4450-871A-903E3630D93E"  forHTTPHeaderField:@"p-devid" ];
    
    [manager POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail (error.localizedDescription);
    }];
    
}

//修改密码
+ (void)changePassWordSuccess:(SuccessBlock)success Fail:(FailBlock)fail PassWord:(NSString *)passWord andToken:(NSString *)token{
    //是否需要加密
    Boolean boollean = false;
    
    NSString * str1 = [NSString stringWithFormat:@"%hhu",boollean];
    NSDictionary * dict = @{@"password":passWord,@"p-apiv":@"1.0",@"needEncrypt":str1,@"token":token};
    NSString * url = [NSString stringWithFormat:@"http://api.mishi.cn/user/findPassword/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=1.0"];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //post头
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"*/*" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"gzip, deflate" forHTTPHeaderField:@"Accept-Encoding" ];
    [manager.requestSerializer setValue:@"zh-Hans;q=1" forHTTPHeaderField:@"Accept-Language" ];
    [manager.requestSerializer setValue:@"keep-alive" forHTTPHeaderField:@"Connection" ];
    [manager.requestSerializer setValue:@"365"  forHTTPHeaderField:@"Content-Length" ];
    [manager.requestSerializer setValue:@"application/json; charset=utf-8"  forHTTPHeaderField:@"Content-Type" ];
    [manager.requestSerializer setValue:@"api.mishi.cn"  forHTTPHeaderField:@"Host" ];
    [manager.requestSerializer setValue:@"APISDK/1.0 (iOS;8.1.3;iPhone;;iPhone6)"  forHTTPHeaderField:@"User-Agent" ];
    [manager.requestSerializer setValue:@"1.9.0.67"  forHTTPHeaderField:@"p-appv" ];
    [manager.requestSerializer setValue:@"5EA88C8C-B958-4450-871A-903E3630D93E"  forHTTPHeaderField:@"p-devid" ];
    
    [manager POST:url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success (responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail (error.localizedDescription);
    }];

}

//搜索
+ (void)searchSuccess:(SuccessBlock)success Fail:(FailBlock)fail withSearchKeyWords:(NSString *)keyWords andPage:(int)page andCityName:(NSString *)cityName{
    NSString * str = [cityName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * keyWordStr = [keyWords stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * urlStr = [NSString stringWithFormat:@"http://api.mishi.cn/index/search/?p-pv=1.0&p-rtType=json_orig_result&p-apiv=2.0&city=%@&cityCode=020&currentPage=%d&keywords=%@&lat=23.17625004833672&lng=113.3406608582691&p-apiv=2.0&pageSize=20&searchType=1&sortKey=140&switchType=1",str,page,keyWordStr];
    [self startReqestWithUrl:urlStr params:nil Success:success fail:fail];
}

@end
