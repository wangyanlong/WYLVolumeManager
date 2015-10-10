//
//  WYLDevicVolumeView.m
//  WYLVolumeView
//
//  Created by 王老师 on 15/10/7.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import "WYLDevicVolumeView.h"

@implementation WYLDevicVolumeView

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
    }
    
    return self;

}

- (void)conifgDeviceVolumeView{
    
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height/4.0)];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.titleLabel];


    self.progressLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.frame.size.height/4.0*3, self.frame.size.width, self.frame.size.height/4.0)];
    self.progressLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.progressLabel];


    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0 + self.titleLabel.frame.size.height, self.frame.size.width, self.frame.size.height - self.progressLabel.frame.size.height - self.titleLabel.frame.size.height)];
    [self addSubview:self.imageView];
    
    self.titleLabel.textColor = self.progressLabel.textColor = [UIColor whiteColor];
    
    self.imageView.image = [UIImage imageNamed:@"IMG_3041.JPG"];
    self.titleLabel.text = @"现在的系统音量";
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
