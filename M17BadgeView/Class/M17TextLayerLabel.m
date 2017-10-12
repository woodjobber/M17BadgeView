
//
//  M17TextLayerLabel.m
//
//  Created by Brandon McQuilkin on 29/09/2017.
//  Copyright © 2017 Brandon McQuilkin Inc. All rights reserved.
//
/*
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
 (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify,
 merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#import "M17TextLayerLabel.h"

@implementation M17TextLayerLabel
+ (Class)layerClass {
    return  [CATextLayer class];
}
- (CATextLayer *)textLayer {
    return (CATextLayer *)self.layer;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self __setup];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self textLayer].frame = frame;
        [self __setup];
    }
    return self;
}
- (instancetype)init {
    if (self = [super init]) {
        [self __setup];
    }
    return self;
}
- (void)__setup {
    self.text = self.text;
    self.textColor = self.textColor;
    self.font = self.font;
    [self textLayer].alignmentMode = kCAAlignmentNatural;
    [self textLayer].contentsScale = [UIScreen mainScreen].scale;
    [self textLayer].wrapped = NO;
    [self textLayer].truncationMode = kCATruncationEnd;
}
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    [self textLayer].frame = frame;
}
- (void)setText:(NSString *)text {
    super.text = text;
    self.textLayer.string = text;
}
- (void)setTextColor:(UIColor *)textColor {
    super.textColor = textColor;
    [self textLayer].foregroundColor = textColor.CGColor;
}
- (void)setTextAlignment:(NSTextAlignment)textAlignment {
    super.textAlignment = textAlignment;
    switch (textAlignment) {
        case NSTextAlignmentCenter:
            [self textLayer].alignmentMode = kCAAlignmentCenter;
            break;
        case NSTextAlignmentLeft:
            [self textLayer].alignmentMode = kCAAlignmentLeft;
            break;
        case NSTextAlignmentNatural:
            [self textLayer].alignmentMode = kCAAlignmentNatural;
            break;
        case NSTextAlignmentRight:
            [self textLayer].alignmentMode = kCAAlignmentRight;
            break;
        case NSTextAlignmentJustified:
            [self textLayer].alignmentMode = kCAAlignmentJustified;
            break;
        default:
            [self textLayer].alignmentMode = kCAAlignmentNatural;
            break;
    }
}
- (void)setFont:(UIFont *)font{
    super.font = font;
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    [self textLayer].font = fontRef;
    [self textLayer].fontSize = font.pointSize;
    CGFontRelease(fontRef);
}
- (void)setBackgroundColor:(UIColor *)backgroundColor {
    super.backgroundColor = backgroundColor;
    [self textLayer].backgroundColor = (__bridge CGColorRef _Nullable)(backgroundColor);
}
@end
