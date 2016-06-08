//
//  ceshiTableVC.m
//  radiousConor
//
//  Created by zhn on 16/4/29.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ceshiTableVC.h"
#import "UIImageView+ZHNimageCache.h"
@interface ceshiTableVC()

@property (nonatomic,copy) NSArray * statusArray;
@end



@implementation ceshiTableVC


- (void)viewDidLoad{
    
    [super viewDidLoad];
    self.statusArray =@[@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg",@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg",@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg",@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg",@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg",@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg",@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg",@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg"
    ];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.statusArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [[UITableViewCell alloc]init];
    UIImageView * ceShiImageView = [[UIImageView alloc]init];
    ceShiImageView.backgroundColor = [UIColor whiteColor];
    [cell addSubview:ceShiImageView];
    ceShiImageView.frame = CGRectMake(0, 0, 200, 50); // 需要先设frame 要拿到frame 做key 不同的frame 下的mode 是不一样的
    [ceShiImageView zhn_setImageWithUrl:self.statusArray[indexPath.row] withContentMode:ZHN_contentModeLeft];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}


@end
