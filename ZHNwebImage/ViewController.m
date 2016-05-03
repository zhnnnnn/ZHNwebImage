//
//  ViewController.m
//  radiousConor
//
//  Created by zhn on 16/4/27.
//  Copyright © 2016年 zhn. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+ZHNimage.h"
#import "ZHNimageDownLoader.h"
#import "UIImageView+ZHNimageCache.h"
#import "ZHNmemoryCache.h"
#import "ZHNdiskCache.h"
#import "ZHNwebImageCache.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    
//    UIImageView * temp = [[UIImageView alloc]init];
//    temp.frame = CGRectMake(0, 0, 400, 200);
//    [self.view addSubview:temp];
////    [temp setRadius:10 withImage:[UIImage imageNamed:@"meinv"]];
////    [temp setRadius:20 contentMode:ZHN_contentModeTop withImage:[UIImage imageNamed:@"meinv"] frame:CGRectMake(0, 0, 200, 200)];
//    temp.backgroundColor = [UIColor whiteColor];
////    [temp zhn_setContentMode:ZHN_contentModeCenter withImage:[UIImage imageNamed:@"meinv"] frame:CGRectMake(0, 0, 300, 200)];
////    UIImageView * bottom = [[UIImageView alloc]init];
//////    bottom.backgroundColor = [UIColor redColor];
////    [self.view addSubview:bottom];
////    bottom.frame = CGRectMake(0, 0, 200, 200);
////    bottom.ZHN_image = [UIImage imageNamed:@"atm"];
////    bottom.ZHN_imageMode = ZHN_contentModeTop;
//
////    UIImageView * center = [[UIImageView alloc]init];
////    [self.view addSubview:center];
////    center.frame = CGRectMake(0, 500, 200, 300);
////    center.ZHN_image = [UIImage imageNamed:@"meinv"];
////    center.ZHN_imageMode = ZHN_contentModeCenter;
////
////    UIImageView * top = [[UIImageView alloc]init];
////    [self.view addSubview:top];
////    top.contentMode = UIViewContentModeBottom;
////    top.frame = CGRectMake(0, 400, 200, 100);
////    top.image = [UIImage imageNamed:@"meinv"];
////    top.ZHN_imageMode = ZHN_contentModeBottom;
//    
//    [temp zhn_setImageWithUrl:@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg" withContentMode:ZHN_contentModeDefault];
    
    
    
    [[ZHNwebImageCache shareInstance]zhnWebImageCache_setImage:[UIImage imageNamed:@"atm"] key:@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg"];
    
    UIImageView * tempImageView = [[UIImageView alloc]init];
    [self.view addSubview:tempImageView];
    tempImageView.frame = CGRectMake(100, 100, 200, 200);

    tempImageView.image = [[ZHNwebImageCache shareInstance]zhnWebImageCache_getImageWithKey:@"http://hwq-video.b0.upaiyun.com/image/e8afe58becd880ded60fee45266840c9.jpg"];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
