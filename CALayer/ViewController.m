//
//  ViewController.m
//  CALayer
//
//  Created by 指尖的跃动 on 16/9/4.
//  Copyright © 2016年 HuangCaixia. All rights reserved.
//

#import "ViewController.h"

//获取设备的物理宽度
#define mScreenWidth          ([UIScreen mainScreen].bounds.size.width)
#define mScreenHeight         ([UIScreen mainScreen].bounds.size.height)


@interface ViewController ()

@property (nonatomic,strong)CALayer * layer;
@property (nonatomic, strong) UIImageView *moreView;

@end

@implementation ViewController

- (UIImageView *)moreView
{
    if (!_moreView) {
        _moreView = [[UIImageView alloc] init];
        
        UIImage *image = [UIImage imageNamed:@"bull_list_bg.png"];
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(20, 10, 20, 10) resizingMode:UIImageResizingModeStretch];
        _moreView.image = image;
        _moreView.userInteractionEnabled = YES;
        
        _moreView.layer.anchorPoint = CGPointMake(0.9, 0);
        _moreView.layer.bounds = CGRectMake(0, 0, 155, 212);
        _moreView.layer.position = CGPointMake(mScreenWidth - 30, 44 + 10);
        
        NSArray *titleArr;
        titleArr = @[@"item1", @"item2", @"item3",@"item4", @"item5"];
//        _moreView.frame = CGRectMake(mScreenWidth - 155 - (155-10) * 0.1, 44 + 10, 155, 212);
        
        
        for (int i = 0; i < titleArr.count; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:titleArr[i] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:15];
            button.frame = CGRectMake(0, 10 + 40 * i, _moreView.bounds.size.width, 40);
//            [button addTarget:self action:@selector(moreButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 100 + i;
            [_moreView addSubview:button];
            
            if (i != titleArr.count - 1) {
                UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(0, button.bounds.size.height - 1, _moreView.bounds.size.width, 1)];
                line.image = [UIImage imageNamed:@"bull_list_line.png"];
                [button addSubview:line];
            }
        }
        
        _moreView.hidden = YES;
        [self.view addSubview:_moreView];
    }
    return _moreView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CALayer * layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    layer.bounds = CGRectMake(0, 0, 100, 100); //控制大小
    layer.position = CGPointMake(100, 100); //控制x,y,设置在父视图中的位置，以父视图左上角为原点（0，0）
    layer.anchorPoint = CGPointMake(0, 0); //定点，锚点，决定CALayer身上的哪个点会在position属性所指的位置，以自己的左上角为原点（0，0），取值在[0,1]
    
    self.layer = layer;
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if (self.moreView.hidden) { //显示
        
        self.moreView.hidden = NO;
        self.moreView.transform = CGAffineTransformMakeScale(0.0001, 0.001);
        [UIView animateWithDuration:0.3 animations:^{
            self.moreView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
    } else { //隐藏
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.moreView.transform = CGAffineTransformMakeScale(0.0001, 0.001);
            
        } completion:^(BOOL finished) {
            if (finished) {
                self.moreView.hidden = YES;
            }
            
        }];
    }

    self.layer.bounds = CGRectMake(0, 0, 200, 200);
    self.layer.cornerRadius = 100;
    self.layer.backgroundColor = [UIColor yellowColor].CGColor;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.cornerRadius = 0;
    self.layer.backgroundColor = [UIColor redColor].CGColor;
}

@end
