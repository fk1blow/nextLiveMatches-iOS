//
//  EventCellView.m
//  NextLiveMatches
//
//  Created by Dragosy on 4/25/13.
//  Copyright (c) 2013 Dragosy. All rights reserved.
//

#import <CoreGraphics/CoreGraphics.h>
#import "EventCellView.h"

@implementation EventCellView

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        NSLog(@"EventCellView init");
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.selectedBackgroundView.frame];
    [backgroundView setBackgroundColor:[UIColor colorWithRed:0.46 green:0 blue:47 alpha:0.4]];
    [self setSelectedBackgroundView:backgroundView];
}


// When using autolayout, you shouldn't update the frames
/*- (void)layoutSubviews
{
//    UILabel *p1 = [self.participants objectAtIndex:1];

//    CGSize maximumLabelSize = CGSizeMake(100,9999);

    for(UILabel * label in self.participants) {
        NSLog(@"label named %@ and width %f, container size %f", label.text, label.frame.size.width, self.bounds.size.width);

        CGSize labelSize = [label.text sizeWithFont:label.font];
        NSLog(@"old %f vs new %f", label.frame.size.width, labelSize.width);

        CGRect newFrame = label.frame;
        newFrame.size.width = labelSize.width;

        label.frame = newFrame;
        label.backgroundColor = [UIColor blackColor];

//        CGSize sizeToMakeLabel = [cell.text sizeWithFont:cell.font];
//        cell.frame = CGRectMake(cell.frame.origin.x + cell.frame.size.width - sizeToMakeLabel.width, cell.frame.origin.y, sizeToMakeLabel.width, sizeToMakeLabel.height);
    }
}*/

@end
