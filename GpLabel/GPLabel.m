//
//  GPLabel.m
//  GpLabel
//
//  Created by Gennady on 03.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GPLabel.h"

@interface GPLabel() {
    CGFloat initialFontSize;
}

- (void) autosizeText;

@end

@implementation GPLabel
@synthesize verticalAlignment = _verticalAlignment;

- (void) autosizeText
{
    UIFont *lfont = self.font;
    int i;
    for(i = initialFontSize; i > self.minimumFontSize; i=i-1)
    {
        lfont = [lfont fontWithSize:i];
        CGSize constraintSize = CGSizeMake(self.frame.size.width, MAXFLOAT);
        CGSize labelSize = [self.text sizeWithFont:lfont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        if(labelSize.height <= self.frame.size.height)
            break;
    }
    
    self.font = lfont;
}

- (void) setText:(NSString *)text
{
    [super setText:text];
    [self autosizeText];
}

- (void) awakeFromNib
{
    
    initialFontSize = self.font.pointSize;
    //Create a string with the text we want to display.
    self.text = @"This is your variable-length string. Assign it any way you want!";
    [self autosizeText];
    self.verticalAlignment = VerticalAlignmentTop;
}

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.verticalAlignment = VerticalAlignmentTop;
    }
    return self;
}

- (void)setVerticalAlignment:(VerticalAlignment)verticalAlignment {
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (self.verticalAlignment) {
        case VerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case VerticalAlignmentMiddle:
            // Fall through.
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}

@end
