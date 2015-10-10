//
//  WYLTouchManager.h
//  WYLVolumeView
//
//  Created by 王老师 on 15/9/28.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import "WYLVolumeSlider.h"
#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <UIKit/UIKit.h>

@interface WYLVolumeManager : NSObject

@property (nonatomic,strong)UISlider *volume;

- (CGFloat)deviceVolume;

- (void)hiddenDeviceSoundViewWithParentView:(UIView *)parentView;

- (void)touchBegin:(UIEvent *)event withTouchView:(UIView *)view;
- (void)touchMove:(UIEvent *)event withTouchView:(UIView *)view withTouchBlock:(void(^)(float num))block;
- (void)touchEnd;

@end
