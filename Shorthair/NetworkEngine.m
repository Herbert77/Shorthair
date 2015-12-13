//
//  NetworkEngine.m
//  Shorthair
//
//  Created by Herbert Hu on 15/12/11.
//  Copyright © 2015年 Herbert Hu. All rights reserved.
//

#import "NetworkEngine.h"

@implementation NetworkEngine

- (MKNetworkOperation *)loginWithCode:(NSString *)code completionHandler:(CompletionHandler)completionHandler errorHandler:(ErrorHandler)errorHandler {
    
    NSString *pathStr = [NSString stringWithFormat:@"/login/oauth/access_token/"];
    NSMutableDictionary *paramsDic = [NSMutableDictionary new];
    
    //TODO: add objects to the mutableDic. clientId, clientSecrete, redirectUrl etc(code, state).
    
    MKNetworkOperation *operation = [self operationWithPath:pathStr params:paramsDic httpMethod:@"POST" ssl:YES];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
        completionHandler([completedOperation responseString]);
        
    } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
        errorHandler(error);
        
    }];
    
    [self enqueueOperation:operation];
    
    return operation;
}



@end
