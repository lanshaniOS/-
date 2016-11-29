//
//  ZCYExaminationTableViewCell.m
//  在重邮
//
//  Created by 周维康 on 16/11/29.
//  Copyright © 2016年 周维康. All rights reserved.
//

#import "ZCYExaminationTableViewCell.h"

@interface ZCYExaminationTableViewCell()

@property (strong, nonatomic) UILabel *courseNameLabel;  /**< 课程名称 */
@property (strong, nonatomic) UILabel *examTimeLabel;  /**< 考试时间 */
@property (strong, nonatomic) UILabel *examAttrLabel;  /**< 考试属性 */
@property (strong, nonatomic) UILabel *leavingDayLabel;  /**< 剩余天数 */
@property (strong, nonatomic) UILabel *classIDLabel;  /**< 教室号 */
@property (strong, nonatomic) UILabel *sitIDLabel;  /**< 座位号 */
@property (strong, nonatomic) UILabel *dateLabel;  /**< 考试日期 */

@end
@implementation ZCYExaminationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.leavingDayLabel = [[UILabel alloc] init];
    [self.leavingDayLabel setFont:kFont(kStandardPx(48)) andText:@"" andTextColor:[UIColor colorWithRGBHex:0xff9c00] andBackgroundColor:kTransparentColor];
    [self addSubview:self.leavingDayLabel];
    [self.leavingDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(15);
        make.centerY.equalTo(self);
    }];
    
    UILabel *dayLabel = [[UILabel alloc] init];
    [dayLabel setFont:kFont(kStandardPx(24)) andText:@"天" andTextColor:[UIColor colorWithRGBHex:0x666666] andBackgroundColor:kTransparentColor];
    [self addSubview:dayLabel];
    [dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leavingDayLabel.mas_right);
        make.bottom.equalTo(self.leavingDayLabel);
    }];
    
    self.courseNameLabel = [[UILabel alloc] init];
    [self.courseNameLabel setFont:kFont(kStandardPx(50)) andText:@"" andTextColor:kCommonText_Color andBackgroundColor:kTransparentColor];
    [self addSubview:self.courseNameLabel];
    [self.courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(24);
        make.left.equalTo(dayLabel.mas_right).with.offset(18);
    }];
    
    self.examTimeLabel = [[UILabel alloc] init];
    [self.examTimeLabel setFont:kFont(kStandardPx(24)) andText:@"" andTextColor:[UIColor colorWithRGBHex:0x666666] andBackgroundColor:kTransparentColor];
    [self addSubview:self.examTimeLabel];
    [self.examTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.courseNameLabel);
        make.top.equalTo(self.courseNameLabel.mas_bottom).with.offset(6);
    }];
    
    self.dateLabel = [[UILabel alloc] init];
    [self.dateLabel setFont:kFont(kStandardPx(25)) andText:@"" andTextColor:kDeepGray_Color andBackgroundColor:kTransparentColor];
    [self addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.examTimeLabel);
        make.top.equalTo(self.examTimeLabel.mas_bottom).with.offset(6);
    }];
    
    self.examAttrLabel = [[UILabel alloc] init];
    [self.examAttrLabel setFont:kFont(kStandardPx(26)) andText:@"" andTextColor:kCommonWhite_Color andBackgroundColor:kDeepGreen_Color];
    self.examAttrLabel.layer.cornerRadius = 2.0f;
    [self addSubview:self.examAttrLabel];
    [self.examAttrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.courseNameLabel.mas_right).with.offset(6);
        make.bottom.equalTo(self.courseNameLabel);
        make.size.mas_equalTo(CGSizeMake(20, 40));
    }];
    
    self.classIDLabel = [[UILabel alloc] init];
    [self.classIDLabel setFont:kFont(50) andText:@"" andTextColor:kCommonText_Color andBackgroundColor:kTransparentColor];
    [self addSubview:self.classIDLabel];
    [self.classIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(30);
        make.bottom.equalTo(self.courseNameLabel);
    }];
    
    self.sitIDLabel = [[UILabel alloc] init];
    [self.sitIDLabel setFont:kFont(kStandardPx(26)) andText:@"" andTextColor:kDeepGray_Color andBackgroundColor:kTransparentColor];
    [self addSubview:self.sitIDLabel];
    [self.sitIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.classIDLabel);
        make.top.equalTo(self.classIDLabel.mas_bottom).with.offset(6);
    }];
}

- (void)setCellWithExamInfo:(NSDictionary *)examInfo
{
    self.courseNameLabel.text = examInfo[@"couese"];
    self.leavingDayLabel.text = examInfo[@"days"];
    self.examTimeLabel.text = [NSString stringWithFormat:@"第 %@ 周 星期%@ %@", examInfo[@"week"], examInfo[@"day"], examInfo[@"time"]];
    self.sitIDLabel.text = examInfo[@"number"];
    self.dateLabel.text = examInfo[@"date"];
    self.classIDLabel = examInfo[@"room"];
}
@end
