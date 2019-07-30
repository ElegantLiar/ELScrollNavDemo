//
//  DemoTableViewCell.m
//  ELScrollNavDemo
//
//  Created by ElegantLiar on 2019/7/30.
//  Copyright © 2019 ElegantLiar. All rights reserved.
//

#import "DemoTableViewCell.h"
#import "UIColor+Extend.h"

@implementation DemoTableViewCell {
    UIImageView     *_avatarImageView;
    UILabel         *_nickNameLabel;
    UILabel         *_chatMessageLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 20, 60, 60)];
    _avatarImageView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_avatarImageView];
    
    _nickNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + 10, CGRectGetMinY(_avatarImageView.frame) + 3, 200, 18)];
    _nickNameLabel.backgroundColor = [UIColor clearColor];
    _nickNameLabel.textColor = [UIColor hexChangeFloat:@"222222"];
    _nickNameLabel.textAlignment = NSTextAlignmentLeft;
    _nickNameLabel.font = [UIFont systemFontOfSize:18];
    _nickNameLabel.text = @"蔡徐坤";
    [self.contentView addSubview:_nickNameLabel];
    
    _chatMessageLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_avatarImageView.frame) + 10, CGRectGetMaxY(_avatarImageView.frame) - 20, 200, 18)];
    _chatMessageLabel.backgroundColor = [UIColor clearColor];
    _chatMessageLabel.textColor = [UIColor hexChangeFloat:@"999999"];
    _chatMessageLabel.textAlignment = NSTextAlignmentLeft;
    _chatMessageLabel.font = [UIFont systemFontOfSize:15];
    _chatMessageLabel.text = @"我喜欢唱、跳、rap";
    [self.contentView addSubview:_chatMessageLabel];
    
    UIView *btmLine = [[UIView alloc] initWithFrame:CGRectMake(0, 79.5, CGRectGetWidth(self.frame), 0.5)];
    btmLine.backgroundColor = [UIColor hexChangeFloat:@"EFEFEF"];
    [self.contentView addSubview:btmLine];
}

@end
