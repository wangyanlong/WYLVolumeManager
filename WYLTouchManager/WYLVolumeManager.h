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

/*!
 *  This delegate control system volume change
 */
@protocol WYLSystemVolumeChangeDelegate <NSObject>

@optional
- (void)systemVolumeDidChange:(CGFloat)value;

@end

@interface WYLVolumeManager : NSObject

@property (nonatomic,weak)id<WYLSystemVolumeChangeDelegate>delegate;

/*!
 *  By volume.value can be changed system volume
 */
@property (nonatomic,strong)UISlider *volume;

/*!
 *  Get system volume number
 */
- (CGFloat)deviceVolume;

/*!
 *  Configure WYLVolumeManager info
 *
 *  @param parentView parentView
 *  @param hidden     hidden system view
 */
- (void)configureVolumeManagerWithParentView:(UIView *)parentView hiddenDeviceVolumeView:(BOOL)hidden;

/*!
 *  This method is used to detect the starting position of the finger.
 */
- (void)touchBegin:(UIEvent *)event withTouchView:(UIView *)view;

/*!
 *  This method is used to detect the position of the sliding process of the fingers.
 *
 *  @param block back system volume number
 */
- (void)touchMove:(UIEvent *)event withTouchView:(UIView *)view withTouchBlock:(void(^)(float num))block;

/*!
 *  This method is used to detect the position of the sliding stop of the fingers.
 */
- (void)touchEnd;

@end
