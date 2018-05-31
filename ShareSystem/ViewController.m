//
//  ViewController.m
//  ShareSystem
//
//  Created by wangning on 2018/5/31.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import "ViewController.h"
#import "CustomActivity.h"

@interface ViewController ()

@end
/**
 分享功能的实现：
 1、利用系统自带的功能
 - 需要导入Social.framework
 
 
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"分享功能";
    
    UIButton *btn1 = [self creatBtnWithY:100 Title:@"分享"];
    
    [self.view addSubview:btn1];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (UIButton *)creatBtnWithY:(CGFloat)Y Title:(NSString *)title{
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, Y, [UIScreen mainScreen].bounds.size.width - 20, 40)];
    btn.tag = Y;
    btn.titleLabel.text = title;
    btn.layer.cornerRadius = 4;
    btn.layer.masksToBounds = YES;
    btn.backgroundColor = [UIColor colorWithRed:0.157 green:0.710 blue:0.914 alpha:1.00];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(activityShare:) forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
- (void)activityShare:(UIButton *)btn{
    
    // 1、设置分享的内容，并将内容添加到数组中
    NSString *shareText = @"分享的标题";
    UIImage *shareImage = [UIImage imageNamed:@"shareImage.png"];
    NSURL *shareUrl = [NSURL URLWithString:@"https://www.jianshu.com/u/15d37d620d5b"];
    NSArray *activityItemsArray = @[shareText,shareImage,shareUrl];
    
    // 自定义的CustomActivity，继承自UIActivity
    CustomActivity *customActivity = [[CustomActivity alloc]initWithTitle:shareText ActivityImage:[UIImage imageNamed:@"custom.png"] URL:shareUrl ActivityType:@"Custom"];
    NSArray *activityArray = @[customActivity];
    
    // 2、初始化控制器，添加分享内容至控制器
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItemsArray applicationActivities:activityArray];
    activityVC.modalInPopover = YES;
    // 3、设置回调
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // ios8.0 之后用此方法回调
        UIActivityViewControllerCompletionWithItemsHandler itemsBlock = ^(UIActivityType __nullable activityType, BOOL completed, NSArray * __nullable returnedItems, NSError * __nullable activityError){
            NSLog(@"activityType == %@",activityType);
            if (completed == YES) {
                NSLog(@"completed");
            }else{
                NSLog(@"cancel");
            }
        };
        activityVC.completionWithItemsHandler = itemsBlock;
    }else{
        // ios8.0 之前用此方法回调
        UIActivityViewControllerCompletionHandler handlerBlock = ^(UIActivityType __nullable activityType, BOOL completed){
            NSLog(@"activityType == %@",activityType);
            if (completed == YES) {
                NSLog(@"completed");
            }else{
                NSLog(@"cancel");
            }
        };
        activityVC.completionHandler = handlerBlock;
    }
    // 4、调用控制器
    [self presentViewController:activityVC animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
