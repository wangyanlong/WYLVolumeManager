//
//  WYLTouchManager.m
//  WYLVolumeView
//
//  Created by 王老师 on 15/9/28.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import "WYLVolumeManager.h"

@implementation WYLVolumeManager

- (CGFloat)deviceVolume{
    return [[AVAudioSession sharedInstance] outputVolume];
}

- (void)hiddenDeviceSoundViewWithParentView:(UIView *)parentView{
    
    MPVolumeView *volumeView = [[MPVolumeView alloc] init];
    [parentView addSubview:volumeView];
    [volumeView sizeToFit];
    volumeView.hidden = NO;
    volumeView.frame = CGRectMake(-1000, 100, 100, 100);

}

- (void)touchBegin:(UIEvent *)event withTouchView:(UIView *)view{
    
    for(UITouch *touch in event.allTouches) {
        
        self.firstPoint = [touch locationInView:view];
        
    }
}

- (void)touchMove:(UIEvent *)event withTouchView:(UIView *)view withTouchBlock:(void(^)(float a))block{

    for(UITouch *touch in event.allTouches) {
        
        self.secondPoint = [touch locationInView:view];
        
    }

    block((self.firstPoint.y - self.secondPoint.y)/500.0);
    
    self.firstPoint = self.secondPoint;

}

- (void)touchEnd{
    self.firstPoint = self.secondPoint = CGPointZero;
}

@end
