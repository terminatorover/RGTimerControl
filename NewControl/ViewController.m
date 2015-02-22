//
//  ViewController.m
//  NewControl
//
//  Created by ROBERA GELETA on 2/22/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import "ViewController.h"
#import "RGView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet RGView *timerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slider:(UISlider *)sender
{

    CGFloat angleValue = 360.0 * sender.value;
    NSLog(@"Value: %f",angleValue );
    [self.timerView setInputAngle:angleValue];
}

@end
