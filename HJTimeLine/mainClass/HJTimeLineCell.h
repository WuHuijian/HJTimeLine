//
//  HJTimeLineCell.h
//  HJTimeLine
//
//  Created by WHJ on 2017/7/11.
//  Copyright © 2017年 WHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HJTimeLineModel;
@interface HJTimeLineCell : UITableViewCell

@property (nonatomic, strong) HJTimeLineModel *model;

@property (nonatomic, strong) UIColor *circleColor;

@property (nonatomic, assign) BOOL showRight;

+ (CGFloat)cellHeight;

- (void)startAnimation;

@end
