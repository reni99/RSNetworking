//
//  RSHTTPSessionManager.m
//  RSNetworking
//
//  Created by Renato Stauffer on 18.06.17.
//  Copyright © 2017 Renato Stauffer. All rights reserved.
//

#import "RSHTTPSessionManager.h"

@implementation RSHTTPSessionManager

- (nullable NSURLSessionDataTask *)performGet:(NSString *)URLString
                            parameters:(nullable id)parameters
                              progress:(nullable void (^)(NSProgress *downloadProgress))downloadProgress
                               success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                               failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    
    return [self GET:URLString parameters:parameters progress:downloadProgress success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)performHead:(NSString *)URLString
                                    parameters:(nullable id)parameters
                                       success:(nullable void (^)(NSURLSessionDataTask *task))success
                                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    return [self HEAD:URLString parameters:parameters success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)performPost:(NSString *)URLString
                                    parameters:(nullable id)parameters
                                      progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                       success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    return [self POST:URLString parameters:parameters progress:uploadProgress success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)performPost:(NSString *)URLString
                                    parameters:(nullable id)parameters
                     constructingBodyWithBlock:(nullable void (^)(id <AFMultipartFormData> formData))block
                                      progress:(nullable void (^)(NSProgress *uploadProgress))uploadProgress
                                       success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                       failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    return [self POST:URLString parameters:parameters constructingBodyWithBlock:block progress:uploadProgress success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)performPut:(NSString *)URLString
                                   parameters:(nullable id)parameters
                                      success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                      failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    return [self PUT:URLString parameters:parameters success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)performPatch:(NSString *)URLString
                                     parameters:(nullable id)parameters
                                        success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                        failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    return [self PATCH:URLString parameters:parameters success:success failure:failure];
}

- (nullable NSURLSessionDataTask *)performDelete:(NSString *)URLString
                                      parameters:(nullable id)parameters
                                         success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                                         failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure {
    return [self DELETE:URLString parameters:parameters success:success failure:failure];
}



@end
