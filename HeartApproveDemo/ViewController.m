//
//  ViewController.m
//  HeartApproveDemo
//
//  Created by Superman on 2018/10/19.
//  Copyright © 2018年 Superman. All rights reserved.
//

#import "ViewController.h"
#import "HeartFlyView.h"


@interface ViewController ()
{
    CGFloat _heartSize;
    NSTimer *_burstTimer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _heartSize = 36;
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showTheLove)];
    [self.view addGestureRecognizer:tapGesture];
    
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesture:)];
    longPressGesture.minimumPressDuration = 0.2;
    [self.view addGestureRecognizer:longPressGesture];
}
-(void)showTheLove{
    DMHeartFlyView* heart = [[DMHeartFlyView alloc]initWithFrame:CGRectMake(0, 0, _heartSize, _heartSize)];
    [self.view addSubview:heart];
    CGPoint fountainSource = CGPointMake(20 + _heartSize/2.0, self.view.bounds.size.height - _heartSize/2.0 - 10);
    heart.center = fountainSource;
    [heart animateInView:self.view];
}

-(void)longPressGesture:(UILongPressGestureRecognizer *)longPressGesture{
    switch (longPressGesture.state) {
        case UIGestureRecognizerStateBegan:
            _burstTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(showTheLove) userInfo:nil repeats:YES];
            break;
        case UIGestureRecognizerStateEnded:
            [_burstTimer invalidate];
            _burstTimer = nil;
            break;
        default:
            break;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
