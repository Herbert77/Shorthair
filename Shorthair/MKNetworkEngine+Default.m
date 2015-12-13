//
//  MKNetworkEngine+Default.m
//  Shorthair
//
//  Created by Herbert Hu on 15/12/11.
//  Copyright © 2015年 Herbert Hu. All rights reserved.
//

#import "MKNetworkEngine+Default.h"

@implementation MKNetworkEngine (Default)

- (id)initWithDefault {
    
    NSMutableDictionary *headerDic = [[NSMutableDictionary alloc] initWithObjects:@[@"application/vnd.github.v3+json"] forKeys:@[@"Accept"]];
    self = [self initWithHostName:@"api.github.com" customHeaderFields:headerDic];
    return self;
}

@end
