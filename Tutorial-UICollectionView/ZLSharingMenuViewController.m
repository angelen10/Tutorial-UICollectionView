//
//  ZLSharingMenuViewController.m
//  Tutorial-UICollectionView
//
//  Created by angelen on 16/10/24.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import "ZLSharingMenuViewController.h"

@interface ZLSharingMenuViewController ()

@end

@implementation ZLSharingMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self setupGestureRecognizer];
    [self setupUIElements];
}

- (void)setupGestureRecognizer {
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapOnBackground)]];
    
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(didTapOnBackground)];
    [swipeGesture setDirection:UISwipeGestureRecognizerDirectionUp];
    [self.view addGestureRecognizer:swipeGesture];
}

- (void)setupUIElements {
    UIImageView *wechatImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_action_share_wechat_normal"]];
    [self.view addSubview:wechatImageView];
}

#pragma mark - GestureRecognizer response

- (void)didTapOnBackground {
    
}

@end
