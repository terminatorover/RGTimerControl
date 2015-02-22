//
//  RGView.h
//  NewControl
//
//  Created by ROBERA GELETA on 2/22/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol RGTimerViewDelegateProtcol <NSObject>
- (void)pauseValue:(BOOL)value;
@end


@interface RGTimerView : UIView
@property (nonatomic) CGFloat inputAngle;
@property (nonatomic) BOOL pauseNow;
@property id<RGTimerViewDelegateProtcol> delegate;
@end

