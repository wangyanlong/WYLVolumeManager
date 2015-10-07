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
        
        MPVolumeView *volumeView = [[MPVolumeView alloc] init];
        [self addSubview:volumeView];
        [volumeView sizeToFit];
        
        volumeView.showsRouteButton = NO;
        volumeView.showsVolumeSlider = NO;
        volumeView.hidden = YES;
        
        self.slider = [[UISlider alloc]init];
        self.slider.backgroundColor = [UIColor blueColor];
        for (UIControl *view in volumeView.subviews) {
            if ([view.superclass isSubclassOfClass:[UISlider class]]) {
                self.slider = (UISlider *)view;
            }
        }
        
        float vol = [[AVAudioSession sharedInstance] outputVolume];

        self.value = vol;
        
        self.minimumValue = 0.0;
        self.maximumValue = 1.0;
        self.slider.maximumValue = 1.0;
        self.slider.minimumValue = 0.0;
        [self addSubview:self.slider];
        self.slider.hidden = YES;
        
        [self addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];

        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChanged:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];

    }
    
    return self;
}

- (void)updateValue:(UISlider *)slider{
    self.slider.value = slider.value;
}

- (void)volumeChanged:(NSNotification *)not{
    
    float vol = [[not.userInfo objectForKey:@"AVSystemController_AudioVolumeNotificationParameter"] floatValue];
    self.value = vol;
    
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
