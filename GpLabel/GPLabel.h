//
//  GPLabel.h
//  GpLabel
//
//  Created by Gennady on 03.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum VerticalAlignment {
    VerticalAlignmentTop,
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;

@interface GPLabel : UILabel
@property (nonatomic, assign) VerticalAlignment verticalAlignment;

@end
