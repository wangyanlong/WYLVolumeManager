//
//  WYLTouchManager.m
//  WYLVolumeView
//
//  Created by 王老师 on 15/9/28.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import "WYLVolumeManager.h"

@interface WYLVolumeManager ()

@property (nonatomic,assign)CGPoint firstPoint;
@property (nonatomic,assign)CGPoint secondPoint;
@property (nonatomic,strong)MPVolumeView *volumeView;

@end

@implementation WYLVolumeManager

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)init{
    
    self = [super init];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChanged:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
    }
    
    return self;
    
}

- (void)volumeChanged:(NSNotification *)not{
    
    float vol = [[not.userInfo objectForKey:@"AVSystemController_AudioVolumeNotificationParameter"] floatValue];
    self.volume.value = vol;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(systemVolumeDidChange:)]) {
        [self.delegate systemVolumeDidChange:vol];
    }
    
}

- (CGFloat)deviceVolume{
    
    return [[AVAudioSession sharedInstance] outputVolume];

}

- (void)configureVolumeManager{
    
}

- (void)configureVolumeManagerWithParentView:(UIView *)parentView hiddenDeviceVolumeView:(BOOL)hidden{

    self.volumeView = [[MPVolumeView alloc] init];
    [parentView addSubview:self.volumeView];
    [self.volumeView sizeToFit];
    
    if (hidden) {
        self.volumeView.hidden = NO;
    }else{
        self.volumeView.hidden = YES;
    }
    self.volumeView.frame = CGRectMake(-1000, 100, 100, 100);


    self.volume = [[UISlider alloc]init];
    for (UIControl *view in self.volumeView.subviews) {
        if ([view.superclass isSubclassOfClass:[UISlider class]]) {
            self.volume = (UISlider *)view;
        }
    }
    
    float vol = [[AVAudioSession sharedInstance] outputVolume];
    
    self.volume.value = vol;
    
}

- (void)touchBegin:(UIEvent *)event withTouchView:(UIView *)view{
    
    for(UITouch *touch in event.allTouches) {
        
        self.firstPoint = [touch locationInView:view];
        
    }
    
}

- (void)touchMove:(UIEvent *)event withTouchView:(UIView *)view withTouchBlock:(void(^)(float num))block{

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
