//
//  Request.h
//  Test0428
//
//  Created by TongDi on 2021/4/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Request : NSObject

- (void)requestCell1Data:(void (^)(id data, NSError *err))callback;
- (void)requestCell2Data:(void (^)(id data, NSError *err))callback;
- (void)requestCell3Data:(void (^)(id data, NSError *err))callback;

@end

NS_ASSUME_NONNULL_END
