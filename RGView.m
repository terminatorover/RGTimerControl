//
//  RGView.m
//  NewControl
//
//  Created by ROBERA GELETA on 2/22/15.
//  Copyright (c) 2015 ROBERA GELETA. All rights reserved.
//

#import "RGView.h"

@implementation RGView

-(void)drawRect:(CGRect)rect
{
    [self drawCanvas1WithAngle:-90 frameWidth:rect.size.width angle5:31];
}

- (void)drawCanvas1WithAngle: (CGFloat)angle frameWidth: (CGFloat)frameWidth angle5: (CGFloat)angle5
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 0.341 green: 0.757 blue: 0.384 alpha: 1];
    UIColor* color2 = [UIColor colorWithRed: 0.122 green: 0.725 blue: 0.973 alpha: 1];
    
    //// Variable Declarations
    CGFloat radius = frameWidth * 0.3;
    CGPoint point1 = CGPointMake(frameWidth * 0.45 + radius * cos(angle * M_PI/180), frameWidth * 0.45 + radius * sin(angle * M_PI/180));
    CGPoint point2 = CGPointMake(frameWidth * 0.45 + radius * cos((angle + 30) * M_PI/180), frameWidth * 0.45 + radius * sin((angle + 30) * M_PI/180));
    CGSize itemSize = CGSizeMake(frameWidth / 10.0, frameWidth / 10.0);
    CGFloat fontSize = itemSize.width / 1.20;
    CGPoint point3 = CGPointMake(frameWidth * 0.45 + radius * cos((angle + 60) * M_PI/180), frameWidth * 0.45 + radius * sin((angle + 60) * M_PI/180));
    CGPoint point5 = CGPointMake(frameWidth * 0.45 + radius * cos((angle + 90) * M_PI/180), frameWidth * 0.45 + radius * sin((angle + 90) * M_PI/180));
    CGSize innerCircle = CGSizeMake(frameWidth * 0.3, frameWidth * 0.3);
    CGPoint innerCirclePosition = CGPointMake(frameWidth * 0.35, frameWidth * 0.35);
    CGPoint point6 = CGPointMake(frameWidth * 0.45 + radius * cos(angle5 * M_PI/180), frameWidth * 0.45 + radius * sin(angle5 * M_PI/180));
    CGPoint point7 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 30) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 30) * M_PI/180));
    CGPoint point8 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 60) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 60) * M_PI/180));
    CGPoint point9 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 90) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 90) * M_PI/180));
    CGPoint point10 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 120) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 120) * M_PI/180));
    CGPoint point11 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 150) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 150) * M_PI/180));
    CGPoint point12 = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 180) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 180) * M_PI/180));
    CGPoint expression = CGPointMake(frameWidth * 0.45 + radius * cos((angle5 + 210) * M_PI/180), frameWidth * 0.45 + radius * sin((angle5 + 210) * M_PI/180));
    
    //// Frames
    CGRect frame = CGRectMake(0, 0, frameWidth, 100);
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(0, 0, frameWidth, frameWidth)];
    [color2 setFill];
    [rectanglePath fill];
    
    
    //// Text Drawing
    CGRect textRect = CGRectMake(point1.x, point1.y, itemSize.width, itemSize.height);
    {
        NSString* textContent = @"0";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: textStyle};
        
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
        
        NSDictionary* text2FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text2Style};
        
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
        
        NSDictionary* text3FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text3Style};
        
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
        
        NSDictionary* text4FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text4Style};
        
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
        
        NSDictionary* text5FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text5Style};
        
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
        
        NSDictionary* text6FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text6Style};
        
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
        
        NSDictionary* text7FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text7Style};
        
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
        
        NSDictionary* text8FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text8Style};
        
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
        
        NSDictionary* text9FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text9Style};
        
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
        
        NSDictionary* text10FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text10Style};
        
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
        
        NSDictionary* text11FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text11Style};
        
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
        
        NSDictionary* text12FontAttributes = @{NSFontAttributeName: [UIFont systemFontOfSize: fontSize], NSForegroundColorAttributeName: UIColor.blackColor, NSParagraphStyleAttributeName: text12Style};
        
        CGFloat text12TextHeight = [textContent boundingRectWithSize: CGSizeMake(text12Rect.size.width, INFINITY)  options: NSStringDrawingUsesLineFragmentOrigin attributes: text12FontAttributes context: nil].size.height;
        CGContextSaveGState(context);
        CGContextClipToRect(context, text12Rect);
        [textContent drawInRect: CGRectMake(CGRectGetMinX(text12Rect), CGRectGetMinY(text12Rect) + (CGRectGetHeight(text12Rect) - text12TextHeight) / 2, CGRectGetWidth(text12Rect), text12TextHeight) withAttributes: text12FontAttributes];
        CGContextRestoreGState(context);
    }
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(innerCirclePosition.x, innerCirclePosition.y, innerCircle.width, innerCircle.height)];
    [color setFill];
    [ovalPath fill];
}


@end
