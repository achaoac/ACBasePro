//
//  FMMJStaticSemaphore.m
//  FMPro
//
//  Created by achaoacwang on 2021/7/20.
//  Copyright © 2021 mfree. All rights reserved.
//

#import "ACMJStaticSemaphore.h"

@implementation ACMJStaticSemaphore

+ (dispatch_semaphore_t)semaphore {
    static dispatch_semaphore_t signalSemaphore;
    static dispatch_once_t onceTokenSemaphore;
    dispatch_once(&onceTokenSemaphore, ^{
        signalSemaphore = dispatch_semaphore_create(1);
    });
    return signalSemaphore;
}

@end
