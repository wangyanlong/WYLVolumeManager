//
//  CustomVolumeViewController.m
//  WYLVolumeView
//
//  Created by 王老师 on 15/10/7.
//  Copyright © 2015年 wyl. All rights reserved.
//
#import "WYLVolumeManager.h"
#import "WYLDevicVolumeView.h"
#import "CustomVolumeViewController.h"

@interface CustomVolumeViewController ()
{
    WYLVolumeManager *manager;
    WYLDevicVolumeView *customVolumeView;
}
@end

@implementation CustomVolumeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    manager = [[WYLVolumeManager alloc]init];
    
    [manager hiddenDeviceSoundViewWithParentView:self.view];
    
    customVolumeView = [[WYLDevicVolumeView alloc]initWithFrame:CGRectMake(60, 100, 250, 270)];
    customVolumeView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.8];
    customVolumeView.showProgressLabel = YES;
    customVolumeView.showTitleLabel = YES;
    customVolumeView.showImageView = YES;
    [customVolumeView conifgDeviceVolumeView];
    
    customVolumeView.value = [manager deviceVolume];
    
    customVolumeView.titleLabel.textColor = customVolumeView.progressLabel.textColor = [UIColor whiteColor];

    customVolumeView.imageView.image = [UIImage imageNamed:@"IMG_3041.JPG"];
    customVolumeView.titleLabel.text = @"现在的系统音量";
    customVolumeView.progressLabel.text = [NSString stringWithFormat:@"系统音量为 : %.2f%%",customVolumeView.value*100];

    [self.view addSubview:customVolumeView];
    customVolumeView.alpha = 0.0;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 400, self.view.frame.size.width, 100)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"请在屏幕上,上下滑动,触发控制音量的操作";
    [self.view addSubview:label];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [manager touchBegin:event withTouchView:self.view];
    
    [UIView animateWithDuration:2 animations:^{
        customVolumeView.alpha = 1.0;
    }];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    __weak __block WYLVolumeManager * _manager = manager;
    
    [_manager touchMove:event withTouchView:self.view withTouchBlock:^(float num) {
        
        customVolumeView.value +=num;
        
        _manager.volume.value = customVolumeView.value;
        
        CGFloat numTest = 0.0;
        
        numTest = customVolumeView.value *100;
        
        if (numTest > 100) {
            numTest = 100.0;
        }else if (numTest < 0){
            numTest = 0.0;
        }else{
            customVolumeView.progressLabel.text = [NSString stringWithFormat:@"系统音量为 : %.2f%%",numTest];
        }
        
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [manager touchEnd];
    [UIView animateWithDuration:2 animations:^{
        customVolumeView.alpha = 0.0;
    }];
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
