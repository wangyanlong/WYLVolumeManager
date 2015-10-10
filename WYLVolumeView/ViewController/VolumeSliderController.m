//
//  VolumeViewController.m
//  WYLVolumeView
//
//  Created by 王老师 on 15/9/27.
//  Copyright © 2015年 wyl. All rights reserved.
//

#import "WYLVolumeSlider.h"
#import "VolumeSliderController.h"

@interface VolumeSliderController ()
{
    WYLVolumeManager *manager;
}
@end

@implementation VolumeSliderController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    manager = [[WYLVolumeManager alloc]init];
    
    //[manager hiddenDeviceSoundViewWithParentView:self.view];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    WYLVolumeSlider *slider1 = [[WYLVolumeSlider alloc] initWithFrame:CGRectMake(100, 200, 200, 20)];
    slider1.tag = 1000;
    [self.view addSubview:slider1];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [manager touchBegin:event withTouchView:self.view];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    WYLVolumeSlider *slider1 = (WYLVolumeSlider *)[self.view viewWithTag:1000];
    
    [manager touchMove:event withTouchView:self.view withTouchBlock:^(float num) {
        slider1.slider.value += num;
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [manager touchEnd];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
