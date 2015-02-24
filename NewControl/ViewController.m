//
//  ViewController.m
//  NewControl
//
//  Created by ROBERA GELETA on 2/22/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import "ViewController.h"
#import "RGTimerView.h"

@interface ViewController ()<RGTimerViewDelegateProtcol>
@property (weak, nonatomic) IBOutlet RGTimerView *timerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.timerView setTotalTimeInSec:60];
    [self.timerView setIncrement:0.05];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)pauseValue:(BOOL)value
{
    NSLog(@"VALUE: %d",value);
}

- (IBAction)resetTimer:(id)sender {
    [self.timerView resetTimer];
}

@end
