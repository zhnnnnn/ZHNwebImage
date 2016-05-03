//
//  ZHNwebImageOperation.m
//  radiousConor
//
//  Created by zhn on 16/5/3.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ZHNwebImageOperation.h"


@interface ZHNwebImageOperation()<NSURLConnectionDataDelegate>{
    BOOL        executing;  // 执行中
    BOOL        finished;   // 已完成
}
@property (nonatomic,strong) NSURLConnection *connection;// 任务
@property (nonatomic,strong) NSMutableData * data;
@property (nonatomic, assign) unsigned long long totalLength;
@property (nonatomic, assign) unsigned long long currentLength;
@property (nonatomic, copy) ZHNimageDownLoadProgressBlock progressBlock;
@property (nonatomic, copy) ZHNimageDownLoadCallBackBlock callbackOnFinished;

@end

@implementation ZHNwebImageOperation

- (instancetype)initWithRequest:(NSURLRequest *)request progress:(ZHNimageDownLoadProgressBlock)progress completion:(ZHNimageDownLoadCallBackBlock)completion{

    if (self = [super init]) {
        self.connection = [[NSURLConnection alloc]initWithRequest:request delegate:self startImmediately:YES];
        self.data = [NSMutableData data];
        self.progressBlock = progress;
        self.callbackOnFinished = completion;
        executing = NO;
        finished = NO;
    }
    return self;
}

- (void)start {
    
    if ([self isCancelled])
    {
        [self willChangeValueForKey:@"isFinished"];
        finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}
- (void)main {
    @try {
        BOOL isFinished = NO;
        // 必须为自定义的 operation 提供 autorelease pool，因为 operation 完成后需要销毁。
        @autoreleasepool {
            while (isFinished == NO && [self isCancelled] == NO){
                [self.connection start];
                isFinished = YES;
            }
            [self completeOperation];
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception %@", e);
    }
}

- (void)completeOperation {
    [self willChangeValueForKey:@"isFinished"];
    [self willChangeValueForKey:@"isExecuting"];
    
    executing = NO;
    finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}

- (BOOL)isAsynchronous {
    return YES;
}

- (BOOL)isExecuting {
    return executing;
}

- (BOOL)isFinished {
    return finished;
}

// 执行操作
- (BOOL)performOperation:(NSOperation*)anOp
{
    BOOL        ranIt = NO;
    
    if ([anOp isReady] && ![anOp isCancelled])
    {
        if (![anOp isAsynchronous]) {
            [anOp start];
        }
        else {
            [NSThread detachNewThreadSelector:@selector(start)
                                     toTarget:anOp withObject:nil];
        }
        ranIt = YES;
    }
    else if ([anOp isCancelled])
    {
        [self willChangeValueForKey:@"isFinished"];
        [self willChangeValueForKey:@"isExecuting"];
        executing = NO;
        finished = YES;
        [self didChangeValueForKey:@"isExecuting"];
        [self didChangeValueForKey:@"isFinished"];
        ranIt = YES;
    }
    return ranIt;
}

- (void)cancelDownLoad{
    [self cancel];
    [self.connection cancel];
}

#pragma mark - 代理方法
// 开始有响应
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [self.data setLength:0];
    self.totalLength = response.expectedContentLength;
    self.currentLength = 0;
}
// 开始接收数据
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [self.data appendData:data];
    self.currentLength += data.length;
    
    if (self.progressBlock) {
        self.progressBlock(self.totalLength, self.currentLength);
    }
}
// 数据下载完成
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    if (self.progressBlock) {
        self.progressBlock(self.totalLength, self.currentLength);
    }
    
    if (self.callbackOnFinished) {
        self.callbackOnFinished([self.data copy], nil);
        // 防止重复调用
        self.callbackOnFinished = nil;
    }
    [self.data setLength:0];
    self.data = nil;
    [self cancel];
}
// 数据下载失败
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
    if ([error code] != NSURLErrorCancelled) {
        if (self.callbackOnFinished) {
            self.callbackOnFinished(nil, error);
        }
        self.callbackOnFinished = nil;
    }
    [self.data setLength:0];
    self.data = nil;
    [self cancel];
}


@end
