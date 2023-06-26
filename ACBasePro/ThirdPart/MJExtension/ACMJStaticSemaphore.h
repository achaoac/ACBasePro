//
//  FMMJStaticSemaphore.h
//  FMPro
//
//  Created by achaoacwang on 2021/7/20.
//  Copyright © 2021 mfree. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define MJExtensionSemaphoreWait \
dispatch_semaphore_wait([ACMJStaticSemaphore semaphore], DISPATCH_TIME_FOREVER);

#define MJExtensionSemaphoreSignal \
dispatch_semaphore_signal([ACMJStaticSemaphore semaphore]);

@interface ACMJStaticSemaphore : NSObject

+ (dispatch_semaphore_t)semaphore;

@end

NS_ASSUME_NONNULL_END
