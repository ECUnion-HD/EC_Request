//
//  Request.m
//  Test0428
//
//  Created by TongDi on 2021/4/28.
//

#import "Request.h"

@implementation Request

- (void)requestCell1Data:(void (^)(id data, NSError *err))callback {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callback(@"我是Cell1", nil);
    });
}

- (void)requestCell2Data:(void (^)(id data, NSError *err))callback {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callback(@"我是Cell2", nil);
    });

}

- (void)requestCell3Data:(void (^)(id data, NSError *err))callback {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        callback(@"我是Cell3", nil);
    });

}

@end
