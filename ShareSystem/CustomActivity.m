//
//  CustomActivity.m
//  ShareTest
//
//  Created by 王盛魁 on 2017/8/28.
//  Copyright © 2017年 WangShengKui. All rights reserved.
//

#import "CustomActivity.h"

@interface CustomActivity ()
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSURL *url;
@property (nonatomic, copy) UIImage *image;
@property (nonatomic, copy) NSString *type;

@end

@implementation CustomActivity
- (instancetype)initWithTitle:(NSString *)title ActivityImage:(UIImage *)activityImage URL:(NSURL *)url ActivityType:(NSString *)activityType{
    self = [super init];
    if (self) {
        self.title = title;
        self.url = url;
        self.image = activityImage;
        self.type = activityType;
    }
    return self;
}
/**
 决定自定义CustomActivity在UIActivityViewController中显示的位置。
 最上层：AirDrop
 中层：Share，即UIActivityCategoryShare
 中层：Action，即UIActivityCategoryAction
 */
+ (UIActivityCategory)activityCategory{
    return UIActivityCategoryAction;
}

- (NSString *)activityType{
    return _type;
}

- (NSString *)activityTitle {
    return _title;
}
/**
 这个得注意，当self.activityCategory = UIActivityCategoryAction时，系统默认会渲染图片，所以不能重写为 - (UIImage *)activityImage {return _image;}
 */
- (UIImage *)_activityImage {
    return _image;
}

- (NSURL *)activityUrl{
    return _url;
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems {
    return YES;
}
/**
 准备分享所进行的方法，通常在这个方法里面，把item中的东西保存下来,items就是要传输的数据。
 */
- (void)prepareWithActivityItems:(NSArray *)activityItems {

}
/**
  1、这里就可以关联外面的app进行分享操作了
  2、也可以进行一些数据的保存等操作
  3、操作的最后必须使用下面方法告诉系统分享结束了
 */
- (void)performActivity {
    [self activityDidFinish:YES];
}
@end
