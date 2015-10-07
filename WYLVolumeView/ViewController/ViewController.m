//
//  ViewController.m
//  WYLVolumeView
//
//  Created by 王老师 on 15/9/27.
//  Copyright © 2015年 wyl. All rights reserved.
//
#import "CustomVolumeViewController.h"
#import "VolumeSliderController.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    [self.dataArr addObject:@"Custom Slider"];
    [self.dataArr addObject:@"Custom DeviceVoiceView"];
    
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArr.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    
    cell.textLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        VolumeSliderController *vvc = [[VolumeSliderController alloc]init];
        [self.navigationController pushViewController:vvc animated:YES];
    }else{
        CustomVolumeViewController *cvc = [[CustomVolumeViewController alloc]init];
        [self.navigationController pushViewController:cvc animated:YES];
    }
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
