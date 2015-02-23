//
//  RGView.m
//  NewControl
//
//  Created by ROBERA GELETA on 2/22/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#define TOTAL_TIME_IN_SEC 60

#import "RGTimerView.h"

#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

@implementation RGTimerView
{
    CGRect _pauseCircleFrame;
    CGFloat _rawAngle;
    CGFloat _computedAngle;
    NSTimer *_timer;
    CGFloat _chosenAmountOfTime;
    CGFloat _amountOfTimePassed;
}



- (void)awakeFromNib
{
    [self setupGestureRecognizer];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setupGestureRecognizer];
    }
    return self;
}

- (void)setupGestureRecognizer
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGestureRecognition:)];
    [self addGestureRecognizer:tapGestureRecognizer];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanningGestureRecognition:)];
    [self addGestureRecognizer:panGestureRecognizer];
    
}
-(void)drawRect:(CGRect)rect
{
    
    [self drawCanvas1WithAngle:-90 frameWidth:rect.size.width angle5:31 progressAngle:_computedAngle hidden:_pauseNow];
}

- (void)drawCanvas1WithAngle: (CGFloat)angle frameWidth: (CGFloat)frameWidth angle5: (CGFloat)angle5 progressAngle: (CGFloat)progressAngle hidden: (BOOL)hidden
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.275 green: 0.337 blue: 0.463 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.227 green: 0.282 blue: 0.4 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 0.176 green: 0.584 blue: 0.851 alpha: 1];
    UIColor* color5 = [UIColor colorWithRed: 0.204 green: 0.259 blue: 0.365 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.157 green: 0.502 blue: 0.718 alpha: 1];
    UIColor* color8 = [UIColor colorWithRed: 0.376 green: 0.439 blue: 0.522 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = [UIColor.blackColor colorWithAlphaComponent: 0.47];
    CGSize shadowOffset = CGSizeMake(1.1, 1.1);
    CGFloat shadowBlurRadius = 5;
    
    //// Variable Declarations
    CGFloat radius = frameWidth * 0.3;
    CGPoint point1 = CGPointMake(frameWidth * 0.45 + radius * cos(angle * M_PI/180), frameWidth * 0.45 + radius * sin(angle * M_PI/180));
    CGPoint point2 = CGPointMake(frameWidth * 0.45 + radius * cos((angle + 30) * M_PI/180), frameWidth * 0.45 + radius * sin((angle + 30) * M_PI/180));
    CGSize itemSize = CGSizeMake(frameWidth / 10.0, frameWidth / 10.0);
    CGFloat fontSize = itemSize.width / 1.20;
    CGPoint anchor1 = CGPointMake(point1.x + 0.16 * itemSize.width, point1.y - itemSize.width);
    CGFloat pauseFontSize = itemSize.width / 1.70;
    CGPoint point3 = CGPointMake(frameWidth * 0.45 + radius * cos((angle + 60) * M_PI/180), frameWidth * 0.45 + radius * sin((angle + 60) * M_PI/180));
    CGPoint point5 = CGPointMake(frameWidth * 0.45 + radius * cos((angle + 90) * M_PI/180), frameWidth * 0.45 + radius * sin((angle + 90) * M_PI/180));
    CGPoint anchor2 = CGPointMake(point5.x + 1.05 * itemSize.width, itemSize.width / 3.0 + point5.y);
    CGSize innerCircle = CGSizeMake(frameWidth * 0.3, frameWidth * 0.3);
    CGPoint innerCirclePosition1 = CGPointMake(frameWidth * 0.35, frameWidth * 0.35);
    CGSize outerCircleSize1 = CGSizeMake(frameWidth * 0.75, frameWidth * 0.75);
    CGPoint outerCirclePosition2 = CGPointMake(frameWidth * 0.12, frameWidth * 0.12);
    CGSize outerCircleSize2 = CGSizeMake(frameWidth * 0.78, frameWidth * 0.78);
    CGPoint outerCirclePosition = CGPointMake(frameWidth * 0.106, frameWidth * 0.106);
    CGPoint outerCirclePosition3 = CGPointMake(frameWidth * 0.087, frameWidth * 0.09);
    CGSize outerCircleSize3 = CGSizeMake(frameWidth * 0.82, frameWidth * 0.82);
    CGPoint outerCirclePosition4 = CGPointMake(frameWidth * 0.077, frameWidth * 0.08);
    CGSize outerCircleSize4 = CGSizeMake(frameWidth * 0.84, frameWidth * 0.84);
    CGSize verticalAnchorSize = CGSizeMake(frameWidth / 33.0, frameWidth / 11.0);
    CGSize horizontalAnchorSize = CGSizeMake(frameWidth / 11.0, frameWidth / 33.0);
    CGPoint pausePositionPoint = CGPointMake(frameWidth * 0.4, frameWidth * 0.4);
    CGSize pauseButtonSize = CGSizeMake(frameWidth * 0.2, frameWidth * 0.2);
    CGPoint point6 = CGPointMake(frameWidth * 0.45 + radius * cos(angle5 * M_PI/180), frameWidth * 0.45 + radius * sin(angle5 * M_PI/180));
    CGPoint point7 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 30) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 30) * M_PI/180));
    CGPoint point8 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 60) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 60) * M_PI/180));
    CGPoint anchor3 = CGPointMake(point8.x + 0.1 * itemSize.width, point8.y + itemSize.width);
    CGPoint point9 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 90) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 90) * M_PI/180));
    CGPoint point10 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 120) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 120) * M_PI/180));
    CGPoint point11 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 150) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 150) * M_PI/180));
    CGPoint anchor4 = CGPointMake(point11.x - 1.05 * itemSize.width, itemSize.width / 3.0 + point11.y);
    CGPoint point12 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 180) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 180) * M_PI/180));
    CGPoint expression = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 210) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 210) * M_PI/180));
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, frameWidth, 100);
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, frameWidth, frameWidth)];
    [color2 setFill];
    [rectanglePath fill];
    
    
    //// Oval 5 Drawing
    UIBezierPath* oval5Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(outerCirclePosition4.x, outerCirclePosition4.y, outerCircleSize4.width, outerCircleSize4.height)];
    [color8 setFill];
    [oval5Path fill];
    
    
    //// Oval 4 Drawing
    UIBezierPath* oval4Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake((outerCirclePosition3.x + 0.3), outerCirclePosition3.y, outerCircleSize3.width, outerCircleSize3.height)];
    [color5 setFill];
    [oval4Path fill];
    
    
    //// Oval 3 Drawing
    CGRect oval3Rect = CGRectMake(outerCirclePosition.x, outerCirclePosition.y, outerCircleSize2.width, outerCircleSize2.height);
    UIBezierPath* oval3Path = UIBezierPath.bezierPath;
    [oval3Path addArcWithCenter: CGPointMake(CGRectGetMidX(oval3Rect), CGRectGetMidY(oval3Rect)) radius: CGRectGetWidth(oval3Rect) / 2 startAngle: -90 * M_PI/180 endAngle: -progressAngle * M_PI/180 clockwise: YES];
    [oval3Path addLineToPoint: CGPointMake(CGRectGetMidX(oval3Rect), CGRectGetMidY(oval3Rect))];
    [oval3Path closePath];
    
    [color4 setFill];
    [oval3Path fill];
    
    
    //// Oval 2 Drawing
    UIBezierPath* oval2Path = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(outerCirclePosition2.x, outerCirclePosition2.y, outerCircleSize1.width, outerCircleSize1.height)];
    [color3 setFill];
    [oval2Path fill];
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(point1.x, point1.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"0";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: textStyle};
        
        CGFloat textTextHeight = [textContent boundingRectWithSize: CGSizeMake(textRect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, textRect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(textRect), CGRectGetMinY(textRect) + (CGRectGetHeight(textRect) - textTextHeight) / 2, CGRectGetWidth(textRect), textTextHeight) withAttributes: textFontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 2 Drawing
    CGRect text2Rect = CGRectMake(point2.x, point2.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"5";
        NSMutableParagraphStyle* text2Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text2Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text2FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: text2Style};
        
        CGFloat text2TextHeight = [textContent boundingRectWithSize: CGSizeMake(text2Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text2FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text2Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text2Rect), CGRectGetMinY(text2Rect) + (CGRectGetHeight(text2Rect) - text2TextHeight) / 2, CGRectGetWidth(text2Rect), text2TextHeight) withAttributes: text2FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 3 Drawing
    CGRect text3Rect = CGRectMake(point3.x, point3.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"10";
        NSMutableParagraphStyle* text3Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text3Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text3FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: text3Style};
        
        CGFloat text3TextHeight = [textContent boundingRectWithSize: CGSizeMake(text3Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text3FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text3Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text3Rect), CGRectGetMinY(text3Rect) + (CGRectGetHeight(text3Rect) - text3TextHeight) / 2, CGRectGetWidth(text3Rect), text3TextHeight) withAttributes: text3FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 4 Drawing
    CGRect text4Rect = CGRectMake(point5.x, point5.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"15";
        NSMutableParagraphStyle* text4Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text4Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text4FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: text4Style};
        
        CGFloat text4TextHeight = [textContent boundingRectWithSize: CGSizeMake(text4Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text4FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text4Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text4Rect), CGRectGetMinY(text4Rect) + (CGRectGetHeight(text4Rect) - text4TextHeight) / 2, CGRectGetWidth(text4Rect), text4TextHeight) withAttributes: text4FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 5 Drawing
    CGRect text5Rect = CGRectMake(point6.x, point6.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"20";
        NSMutableParagraphStyle* text5Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text5Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text5FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: text5Style};
        
        CGFloat text5TextHeight = [textContent boundingRectWithSize: CGSizeMake(text5Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text5FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text5Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text5Rect), CGRectGetMinY(text5Rect) + (CGRectGetHeight(text5Rect) - text5TextHeight) / 2, CGRectGetWidth(text5Rect), text5TextHeight) withAttributes: text5FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 6 Drawing
    CGRect text6Rect = CGRectMake(point7.x, point7.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"25";
        NSMutableParagraphStyle* text6Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text6Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text6FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: text6Style};
        
        CGFloat text6TextHeight = [textContent boundingRectWithSize: CGSizeMake(text6Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text6FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text6Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text6Rect), CGRectGetMinY(text6Rect) + (CGRectGetHeight(text6Rect) - text6TextHeight) / 2, CGRectGetWidth(text6Rect), text6TextHeight) withAttributes: text6FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 7 Drawing
    CGRect text7Rect = CGRectMake(point8.x, point8.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"30";
        NSMutableParagraphStyle* text7Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text7Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text7FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: text7Style};
        
        CGFloat text7TextHeight = [textContent boundingRectWithSize: CGSizeMake(text7Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text7FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text7Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text7Rect), CGRectGetMinY(text7Rect) + (CGRectGetHeight(text7Rect) - text7TextHeight) / 2, CGRectGetWidth(text7Rect), text7TextHeight) withAttributes: text7FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 8 Drawing
    CGRect text8Rect = CGRectMake(point9.x, point9.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"35";
        NSMutableParagraphStyle* text8Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text8Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text8FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: text8Style};
        
        CGFloat text8TextHeight = [textContent boundingRectWithSize: CGSizeMake(text8Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text8FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text8Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text8Rect), CGRectGetMinY(text8Rect) + (CGRectGetHeight(text8Rect) - text8TextHeight) / 2, CGRectGetWidth(text8Rect), text8TextHeight) withAttributes: text8FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 9 Drawing
    CGRect text9Rect = CGRectMake(point10.x, point10.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"40";
        NSMutableParagraphStyle* text9Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text9Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text9FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: text9Style};
        
        CGFloat text9TextHeight = [textContent boundingRectWithSize: CGSizeMake(text9Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text9FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text9Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text9Rect), CGRectGetMinY(text9Rect) + (CGRectGetHeight(text9Rect) - text9TextHeight) / 2, CGRectGetWidth(text9Rect), text9TextHeight) withAttributes: text9FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 10 Drawing
    CGRect text10Rect = CGRectMake(point11.x, point11.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"45";
        NSMutableParagraphStyle* text10Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text10Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text10FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: text10Style};
        
        CGFloat text10TextHeight = [textContent boundingRectWithSize: CGSizeMake(text10Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text10FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text10Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text10Rect), CGRectGetMinY(text10Rect) + (CGRectGetHeight(text10Rect) - text10TextHeight) / 2, CGRectGetWidth(text10Rect), text10TextHeight) withAttributes: text10FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 11 Drawing
    CGRect text11Rect = CGRectMake(point12.x, point12.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"50";
        NSMutableParagraphStyle* text11Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text11Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text11FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: text11Style};
        
        CGFloat text11TextHeight = [textContent boundingRectWithSize: CGSizeMake(text11Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text11FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text11Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text11Rect), CGRectGetMinY(text11Rect) + (CGRectGetHeight(text11Rect) - text11TextHeight) / 2, CGRectGetWidth(text11Rect), text11TextHeight) withAttributes: text11FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Text 12 Drawing
    CGRect text12Rect = CGRectMake(expression.x, expression.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"55";
        NSMutableParagraphStyle* text12Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        text12Style.alignment = NSTextAlignmentLeft;
        
        NSDictionary* text12FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.lightGrayColor, NSParagraphStyleAttributeName: text12Style};
        
        CGFloat text12TextHeight = [textContent boundingRectWithSize: CGSizeMake(text12Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text12FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text12Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text12Rect), CGRectGetMinY(text12Rect) + (CGRectGetHeight(text12Rect) - text12TextHeight) / 2, CGRectGetWidth(text12Rect), text12TextHeight) withAttributes: text12FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Oval Drawing
    _pauseCircleFrame = CGRectMake(innerCirclePosition1.x, innerCirclePosition1.y, innerCircle.width, innerCircle.height);
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect:_pauseCircleFrame ];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, [shadow CGColor]);
    [color6 setFill];
    [ovalPath fill];
    CGContextRestoreGState(context);
    
    
    
    //// Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(anchor1.x, anchor1.y, verticalAnchorSize.width, verticalAnchorSize.height)];
    [UIColor.whiteColor setFill];
    [rectangle2Path fill];
    
    
    //// Rectangle 3 Drawing
    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(anchor3.x, anchor3.y, verticalAnchorSize.width, verticalAnchorSize.height)];
    [UIColor.whiteColor setFill];
    [rectangle3Path fill];
    
    
    //// Rectangle 4 Drawing
    UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(anchor4.x, anchor4.y, horizontalAnchorSize.width, horizontalAnchorSize.height)];
    [UIColor.whiteColor setFill];
    [rectangle4Path fill];
    
    
    //// Rectangle 5 Drawing
    UIBezierPath* rectangle5Path = [UIBezierPath bezierPathWithRect: CGRectMake(anchor2.x, anchor2.y, horizontalAnchorSize.width, horizontalAnchorSize.height)];
    [UIColor.whiteColor setFill];
    [rectangle5Path fill];
    
    
    if (hidden)
    {
        //// Text 13 Drawing
        CGRect text13Rect = CGRectMake(pausePositionPoint.x, pausePositionPoint.y, pauseButtonSize.width, pauseButtonSize.height);
        {
            NSString* textContent = @"PAUSE";
            NSMutableParagraphStyle* text13Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
            text13Style.alignment = NSTextAlignmentLeft;
            
            NSDictionary* text13FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: pauseFontSize], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: text13Style};
            
            CGFloat text13TextHeight = [textContent boundingRectWithSize: CGSizeMake(text13Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text13FontAttributes context: nil].size.height;
            CGContextSaveGState(context);
            CGContextClipToRect(context, text13Rect);
            [textContent drawInRect: CGRectMake(CGRectGetMinX(text13Rect), CGRectGetMinY(text13Rect) + (CGRectGetHeight(text13Rect) - text13TextHeight) / 2, CGRectGetWidth(text13Rect), text13TextHeight) withAttributes: text13FontAttributes];
            CGContextRestoreGState(context);
        }
        
    }else
    {
        //// Text 14 Drawing
        CGRect text14Rect = CGRectMake(pausePositionPoint.x, pausePositionPoint.y, pauseButtonSize.width, pauseButtonSize.height);
        {
            NSString* textContent = @"START";
            NSMutableParagraphStyle* text14Style = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
            text14Style.alignment = NSTextAlignmentLeft;
            
            NSDictionary* text14FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: pauseFontSize], NSForegroundColorAttributeName: UIColor.whiteColor, NSParagraphStyleAttributeName: text14Style};
            
            CGFloat text14TextHeight = [textContent boundingRectWithSize: CGSizeMake(text14Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text14FontAttributes context: nil].size.height;
            CGContextSaveGState(context);
            CGContextClipToRect(context, text14Rect);
            [textContent drawInRect: CGRectMake(CGRectGetMinX(text14Rect), CGRectGetMinY(text14Rect) + (CGRectGetHeight(text14Rect) - text14TextHeight) / 2, CGRectGetWidth(text14Rect), text14TextHeight) withAttributes: text14FontAttributes];
            CGContextRestoreGState(context);
        }
    }
}



-(void)setInputAngle:(CGFloat)inputAngle
{
    _inputAngle = inputAngle;
    _computedAngle = [self drawingAngleFromUserAngle:_inputAngle];
    [self setNeedsDisplay];
}

- (void)setPauseNow:(BOOL)pauseNow
{
    _pauseNow = pauseNow;
    [self setNeedsDisplay];
}


#pragma mark - Handling Tap Recognition
-(void)handleTapGestureRecognition:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint tapPoint =  [tapGestureRecognizer locationInView:self];
    if(CGRectContainsPoint(_pauseCircleFrame,tapPoint))
    {
        _pauseNow = !_pauseNow;
        if(_delegate && [_delegate respondsToSelector:@selector(pauseValue:)])
        {
            [_delegate pauseValue:_pauseNow];
        }
    }
    if(_pauseNow)//if we are seeing the pause button the user want's their timer started
    {
        _chosenAmountOfTime  = TOTAL_TIME_IN_SEC * [self percentageFromAngle:_rawAngle];
        _timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                  target:self
                                                selector:@selector(countUp:)
                                                userInfo:nil
                                                 repeats:YES];
        
    }else//pause the timer
    {
        
    }
    
    
    [self setNeedsDisplay];
}

- (void)handlePanningGestureRecognition:(UIPanGestureRecognizer *)panGestureRecognizer
{
    CGPoint currentTouch = [panGestureRecognizer locationInView:self];
    //get the angle  from the touch  location
    _rawAngle =  RADIANS_TO_DEGREES(pToA(currentTouch, self));
    _computedAngle = [self drawingAngleFromTouchAngle:_rawAngle];
    NSLog(@"ANGLE:-> %f, COMPUTED_ANGLE:%f",_rawAngle,_computedAngle);
    [self setNeedsDisplay];
}


#pragma mark - Angle Computations
- (CGFloat)drawingAngleFromTouchAngle:(CGFloat)angle
{
    
    if(angle >= -90 && angle <= 0)
    {
        return  - 1 * angle ;
    }
    else if (angle > 0 && angle <= 180)
    {
        return - 1 * angle;
    }else
    {
        return -1 * (360- abs(angle));
    }
    
    return 0.0;
}

- (CGFloat)drawingAngleFromUserAngle:(CGFloat)angle
{
    CGFloat drawingAngle ;
    if(angle >= 180)
    {
        drawingAngle = -90 - abs((angle -180)); // angle - 360;
    }else if (angle > 90)
    {
        drawingAngle =  -1 * (-90 + angle);
    }
    else
    {
        drawingAngle = 90 - angle;
    }
    NSLog(@"CALCULATED ANGLE:%f",drawingAngle);
    return drawingAngle;
}

static CGFloat pToA (CGPoint loc, UIView* self) {
    
    CGPoint c = CGPointMake(CGRectGetMidX(self.bounds),
                            CGRectGetMidY(self.bounds));
    
    return atan2(loc.y - c.y, loc.x - c.x);
}

- (CGFloat)percentageFromAngle:(CGFloat)angle
{
    CGFloat correctAngle;
    if(angle <= 180)
    {
        correctAngle = angle + 90;
    }else
    {
        correctAngle = angle + 450;
    }
    
    return correctAngle/360.00;
}



#pragma mark - Handling Time Ticking
- (void)countUp:(id)timer
{
    NSLog(@"TIMER");
    _amountOfTimePassed += 1;
    CGFloat angleMoved =  360 *_amountOfTimePassed / _chosenAmountOfTime;
    _computedAngle  -= angleMoved;
    [self setNeedsDisplay];
    if(angleMoved == 360)
    {
        [_timer invalidate];
        _timer = nil;
        self.pauseNow = NO;
    }
    [self setNeedsDisplay];
}

@end
