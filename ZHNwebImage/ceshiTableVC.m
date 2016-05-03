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
    self.statusArray =@[
            @"http://ww2.sinaimg.cn/crop.0.0.920.300/48e3f28dgw1ephvzwunvjj20pk08cwg4.jpg",
            @"http://ww1.sinaimg.cn/crop.0.0.720.720.1024/48e3f28djw8eix7rrtdlxj20k00k00tr.jpg",
            @"http://ww1.sinaimg.cn/crop.0.0.2043.2043.1024/3d264de4gw1elmjqcn1f9j21kw1kwb29.jpg",
            @"http://ww4.sinaimg.cn/crop.0.0.640.640/6cf8d7ebjw1ehfr60whp7j20hs0hsacf.jpg",
            @"http://ww4.sinaimg.cn/crop.0.0.441.441.1024/6c19279egw1eidj25gl58j20ca0ca3zs.jpg",
            @"http://ww2.sinaimg.cn/crop.0.0.640.640.640/a1d3feabjw1ecasunmkncj20hs0hsq4j.jpg",
            @"http://ww1.sinaimg.cn/large/4e704b16jw1evvinwpsrrj205k05kmxd.jpg",
            @"http://ww2.sinaimg.cn/woriginal/ebebae87jw1evvh9eq0yfj22io1w01kx.jpg",
            @"http://ww2.sinaimg.cn/large/ebebae87jw1evvh9eq0yfj22io1w01kx.jpg",
            @"http://ww2.sinaimg.cn/or180/ebebae87jw1evvh9eq0yfj22io1w01kx.jpg",
            @"http://ww2.sinaimg.cn/wap720/ebebae87jw1evvh9eq0yfj22io1w01kx.jpg",
            @"http://ww2.sinaimg.cn/or480/ebebae87jw1evvh9eq0yfj22io1w01kx.jpg",
            @"http://ww2.sinaimg.cn/or360/ebebae87jw1evvh9eq0yfj22io1w01kx.jpg",
            @"http://ww4.sinaimg.cn/crop.0.0.480.480.1024/ebebae87jw8edqmlxzypxj20dc0dcmxr.jpg",
            @"http://ww1.sinaimg.cn/crop.0.0.920.300/68318509gw1eu2bptwynpj20pk08cdhc.jpg",
            @"http://ww4.sinaimg.cn/crop.0.0.928.928.1024/68318509jw8eqj6kendz0j20ps0ps0tn.jpg"
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
