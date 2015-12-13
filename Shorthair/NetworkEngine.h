//
//  NetworkEngine.h
//  Shorthair
//
//  Created by Herbert Hu on 15/12/11.
//  Copyright © 2015年 Herbert Hu. All rights reserved.
//

#import "MKNetworkEngine.h"

typedef void(^CompletionHandler)(NSString *response);
typedef void(^ErrorHandler)(NSError *error);


@interface NetworkEngine : MKNetworkEngine

#pragma mark - LoginModule
- (MKNetworkOperation *)loginWithCode:(NSString *)code
                    completionHandler:(CompletionHandler)completionHandler
                         errorHandler:(ErrorHandler)errorHandler;



@end
