//
//  GprogViewController.h
//  GpLabel
//
//  Created by Gennady on 03.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPLabel.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet GPLabel *myLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;
- (IBAction)setText:(id)sender;

@end
