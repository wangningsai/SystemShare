//
//  CustomActivity.h
//  ShareSystem
//
//  Created by wangning on 2018/5/31.
//  Copyright © 2018年 王宁. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomActivity : UIActivity
- (instancetype)initWithTitle:(NSString *)title ActivityImage:(UIImage *)activityImage URL:(NSURL *)url ActivityType:(NSString *)activityType;
@end
