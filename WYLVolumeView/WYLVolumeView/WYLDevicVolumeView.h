//
//  WYLDevicVolumeView.h
//  WYLVolumeView
//
//  Created by 王老师 on 15/10/7.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYLDevicVolumeView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *progressLabel;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, assign) CGFloat value;
@property (nonatomic, assign) BOOL showTitleLabel;
@property (nonatomic, assign) BOOL showProgressLabel;
@property (nonatomic, assign) BOOL showImageView;

- (void)conifgDeviceVolumeView;

@end
