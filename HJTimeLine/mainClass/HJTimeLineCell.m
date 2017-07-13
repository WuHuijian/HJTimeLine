//
//  HJTimeLineCell.m
//  HJTimeLine
//
//  Created by WHJ on 2017/7/11.
//  Copyright © 2017年 WHJ. All rights reserved.
//

#import "HJTimeLineCell.h"
#import "HJTimeLineModel.h"

@interface HJTimeLineCell ()

@property (nonatomic, strong) UIView *verticalLine;

@property (nonatomic, strong) UIView *horizontalLine;

@property (nonatomic, strong) UIView *lineCircle;

@property (nonatomic, strong) UIButton *circleBtn;



@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation HJTimeLineCell

#pragma mark - Life Circle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self setupUI];
    }
    return self;
}

#pragma mark - About UI
- (void)setupUI{
    
    self.contentView.backgroundColor = [UIColor grayColor];
    
    self.verticalLine = [[UIView alloc] init];
    [self.contentView addSubview:self.verticalLine];
    
    self.horizontalLine = [[UIView alloc] init];
    [self.contentView addSubview:self.horizontalLine];
    
    self.lineCircle = [[UIView alloc] init];
    [self.contentView addSubview:self.lineCircle];
    
    
    self.circleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.contentView addSubview:self.circleBtn];
    
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.titleLabel];
    
    self.subTitleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.subTitleLabel];
    
    self.timeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:self.timeLabel];
    
}

- (void)configUI{
    
    CGFloat width = CGRectGetWidth(self.frame);
    CGFloat height = CGRectGetHeight(self.frame);
    CGFloat centerX = CGRectGetWidth(self.frame)/2.f;
    CGFloat centerY = CGRectGetHeight(self.frame)/2.f;
    CGFloat lineCircleWidth = 20.f;
    CGFloat horizontalLineWidth = 40;
    CGFloat lineHeight = 1.f;
    CGFloat circleBtnWidth = 60;
    CGFloat margin = 10.f;
    CGFloat fontSize = 12.f;
    
    self.verticalLine.backgroundColor = [UIColor whiteColor];
    self.verticalLine.frame = CGRectMake(centerX, 0, lineHeight, height);
    self.horizontalLine.backgroundColor = self.circleColor;
    
    self.lineCircle.frame  = CGRectMake(0, 0, lineCircleWidth, lineCircleWidth);
    self.lineCircle.center = self.contentView.center;
    self.lineCircle.backgroundColor = self.contentView.backgroundColor;
    self.lineCircle.layer.masksToBounds = YES;
    self.lineCircle.layer.borderWidth = lineHeight;
    self.lineCircle.layer.borderColor = self.circleColor.CGColor;
    self.lineCircle.layer.cornerRadius = lineCircleWidth/2.f;
    
    self.circleBtn.layer.cornerRadius = circleBtnWidth/2.f;
    self.circleBtn.layer.borderColor = self.circleColor.CGColor;
    self.circleBtn.layer.borderWidth = lineHeight;
    self.circleBtn.layer.masksToBounds = YES;
    self.circleBtn.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    self.circleBtn.titleLabel.numberOfLines = 2;
    [self.circleBtn setTitleColor:self.circleColor forState:UIControlStateNormal];
    
    self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    self.subTitleLabel.font = [UIFont systemFontOfSize:fontSize];
    self.timeLabel.font = [UIFont systemFontOfSize:fontSize];
    self.titleLabel.textColor = self.circleColor;
    self.subTitleLabel.textColor = self.circleColor;
    self.timeLabel.textColor = self.circleColor;
    
    self.titleLabel.textAlignment = !self.showRight?NSTextAlignmentRight:NSTextAlignmentLeft;
    self.subTitleLabel.textAlignment = !self.showRight?NSTextAlignmentRight:NSTextAlignmentLeft;
    self.timeLabel.textAlignment = !self.showRight?NSTextAlignmentRight:NSTextAlignmentLeft;
    
    
    if(self.showRight){
    
        self.horizontalLine.frame = CGRectMake(centerX, centerY, horizontalLineWidth, lineHeight);
        self.circleBtn.frame = CGRectMake(CGRectGetMaxX(self.horizontalLine.frame), centerY-circleBtnWidth/2.f, circleBtnWidth, circleBtnWidth);
        self.titleLabel.frame = CGRectMake(CGRectGetMaxX(self.circleBtn.frame)+margin, centerY-fontSize-5, width-(CGRectGetMinX(self.circleBtn.frame)+margin), fontSize);
        self.subTitleLabel.frame = CGRectMake(CGRectGetMaxX(self.circleBtn.frame), centerY+5, width-CGRectGetMinX(self.circleBtn.frame)-margin, fontSize);
        self.timeLabel.frame = CGRectMake(self.circleBtn.frame.origin.x, CGRectGetMaxY(self.circleBtn.frame),  width-CGRectGetMinX(self.circleBtn.frame)-margin, fontSize);
    }else{
        self.horizontalLine.frame = CGRectMake(centerX-horizontalLineWidth, centerY, horizontalLineWidth, lineHeight);
        self.circleBtn.frame = CGRectMake(CGRectGetMinX(self.horizontalLine.frame)-circleBtnWidth, centerY-circleBtnWidth/2.f, circleBtnWidth, circleBtnWidth);
        self.titleLabel.frame = CGRectMake(margin, centerY-fontSize-5, CGRectGetMinX(self.circleBtn.frame)-2*margin, fontSize);
        self.subTitleLabel.frame = CGRectMake(margin, centerY+5, CGRectGetMinX(self.circleBtn.frame)-2*margin, fontSize);
        self.timeLabel.frame = CGRectMake(margin, CGRectGetMaxY(self.circleBtn.frame),CGRectGetMaxX(self.circleBtn.frame)-margin, fontSize);
    }
    
    
    

}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self configUI];
}


#pragma mark - Event response

#pragma mark - Pravite Method
- (void)startAnimation{

    self.circleBtn.alpha = 0;
    
    [UIView animateWithDuration:1 animations:^{
    
        self.circleBtn.alpha = 1;
    
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - Public Method
+ (CGFloat)cellHeight{
    
    return 100.f;
}
#pragma mark - Getters/Setters/Lazy
- (void)setModel:(HJTimeLineModel *)model{
    _model = model;
    self.titleLabel.text = model.title;
    self.subTitleLabel.text = model.subTitle;
    self.timeLabel.text = model.timeString;
    [self.circleBtn setTitle:model.content forState:UIControlStateNormal];

}
#pragma mark - Delegate methods


@end
