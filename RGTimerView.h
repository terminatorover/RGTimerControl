//
//  RGView.h
//  NewControl
//
//  Created by ROBERA GELETA on 2/22/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//



#import <UIKit/UIKit.h>
@protocol RGTimerViewDelegateProtcol <NSObject>
/**
 *  This Delegate method gives the delegate an update about the current state of the Main
 *
 *  @param value denotes the state of the timer. value == YES means that the user is currently 
 *  seeing that the text PAUSE and hence givinging feedback to the user that the timer can be 
 *  paused. Conversly, if  value == NO the users sees START.
 */
- (void)pauseValue:(BOOL)value;
@end


@interface RGTimerView : UIView
/**
 *  resetTimer is a way to programtically reset the timer. 
 *  namely, the pauseNow value will be set to NO and the amout of time 
 *  that has elapsed will be set to 0. and the coressponding changes 
 *  will be refelected visually.
 */
- (void)resetTimer;
/**
 *  inputAngle allows the timer's current visual angle to be set. 
 *  eg, 0 degrees is 0 equivlaent to  left
 */
@property (nonatomic,readonly) CGFloat inputAngle;
/**
 *  if pauseNow is YES it means that the text that the user is seeing on the time is PAUSE, else it is START
 */
@property (nonatomic) BOOL pauseNow;
/**
 *  increment is the value of how much secs are added each time the timer fires. 
 *  note if this is not programtically specified the default value used is 1 sec.
 */
@property (nonatomic) CGFloat increment;
/**
 *  totalTimeInSec is the total number of seconds from which the timer starts to count down
 *  note if this is not programtically specified the default value used is 3600 secs.
 */
@property (nonatomic) CGFloat totalTimeInSec;
/**
 *  delegate specified the delegate of the RGTimerView which needs to implement RGTimerViewDelegateProtcol
 */
@property IBOutlet id<RGTimerViewDelegateProtcol> delegate;
@end

