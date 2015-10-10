//
//  WYLVolumeSlider.m
//  WYLVolumeView
//
//  Created by 王老师 on 15/9/27.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import "WYLVolumeSlider.h"

@interface WYLVolumeSlider ()

@end

@implementation WYLVolumeSlider

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.minimumValue = 0.0;
        self.maximumValue = 1.0;
        
        float vol = [[AVAudioSession sharedInstance] outputVolume];

        self.value = vol;
        
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
