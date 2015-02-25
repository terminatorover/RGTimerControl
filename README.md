# RGTimerControl
![g](https://github.com/terminatorover/RGTimerControl/blob/master/pic.png)

This custom control is a count down timer.Note, "Reset Timer" piece is not part of the
control and only shown for demo purpose. The design was taken from 
[ Aleksandar Djuric's work on as seen on Pinterest](https://www.pinterest.com/pin/554294666613031165/)

You can either instantiate it in code via initWithFrame: or drop it in as a class in a nib or storyboard.
Then the user can interact with the control. By by panning to select the amount of time they want to 
allocate for the count down and by tapping on the start and stop "buttons". 

To be notified of the users interaction the implement RGTimerViewDelegateProtcol and implement the 
- (void)pauseValue:(BOOL)value; method. when value is YES it means that the user has already hit START
and is now able to tap PAUSE to pause the timer. Conversly when the value is NO it means that the user 
has hit pause. 

- you can reset the timer via the resetTimer method, and pause the timer programtically by setting the
pauseNow property. 

##Customizing
There are two properties for customization. increment, and totalTimeInSec

   increment is the value of how much secs are added each time the timer fires. 
   note if this is not programtically specified the default value used is 1 sec.
   
   totalTimeInSec is the total number of seconds from which the timer starts to count down
   note if this is not programtically specified the default value used is 3600 secs.
