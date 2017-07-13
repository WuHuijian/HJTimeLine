//
//  HJTimeLineHeader.m
//  HJTimeLine
//
//  Created by WHJ on 2017/7/12.
//  Copyright © 2017年 WHJ. All rights reserved.
//

#import "HJTimeLineHeader.h"

@interface HJTimeLineHeader ()

@property (nonatomic, strong) UIButton *headerBtn;

@end

@implementation HJTimeLineHeader
#pragma mark - Life Circle
-(instancetype)initWithFrame:(CGRect)frame;{
    self = [super initWithFrame:frame];
    if(self){
        
        [self setupUI];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - About UI
- (void)setupUI{
    
    self.circleColor = [UIColor whiteColor];
    
    self.backgroundColor = [UIColor grayColor];
    
    [self addSubview:self.headerBtn];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.headerBtn.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    self.headerBtn.layer.cornerRadius = self.frame.size.height/2.f;
    self.headerBtn.layer.borderColor = self.circleColor.CGColor;
    self.headerBtn.layer.borderWidth = 1.5f;
    self.headerBtn.layer.masksToBounds = YES;
    self.headerBtn.center = self.center;

}
#pragma mark - Event response

#pragma mark - Pravite Method

#pragma mark - Public Method

#pragma mark - Getters/Setters/Lazy
- (UIButton *)headerBtn{
    if (!_headerBtn) {
        _headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _headerBtn.enabled = NO;
    }
    return _headerBtn;
}


- (void)setTitle:(NSString *)title{
    _title = title;
    [self.headerBtn setTitle:title forState:UIControlStateNormal];
}

#pragma mark - Delegate methods
@end
