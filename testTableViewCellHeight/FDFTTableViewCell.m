//
//  FDFTTableViewCell.m
//  FDFTemplateLayoutDemo
//
//  Created by zhang_rongwu on 15/8/27.
//  Copyright (c) 2015年 zhang_rongwu. All rights reserved.
//

#import "FDFTTableViewCell.h"
#define HFFontX(s)  [UIFont systemFontOfSize:s]
@implementation FDFTTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.V_Label = [[UILabel alloc] init];
        self.V_Label.font = HFFontX(21);
        self.V_Label.alpha = 0.72;
        [self.V_Label sizeToFit];
        self.V_Label.numberOfLines = 0;
        self.V_Label.textColor = [UIColor redColor];
        [self addSubview:self.V_Label];
        
        self.K_Label = [[UILabel alloc] init];
        [self addSubview:self.K_Label];
        [self.K_Label sizeToFit];
        self.K_Label.alpha = 0.54;
        self.K_Label.numberOfLines = 0;
        self.K_Label.font = HFFontX(13);
        
        self.M_ImageView = [[UIImageView alloc] init];
        self.M_ImageView.image = [UIImage imageNamed:@""];
        [self addSubview:self.M_ImageView];
        
        self.N_Label = [[UILabel alloc] init];
        [self addSubview:self.N_Label];
        [self.N_Label sizeToFit];
        self.N_Label.numberOfLines = 0;
        self.N_Label.alpha = 0.54;
        self.N_Label.font = HFFontX(13);
        
        self.courFlagImageView = [[UIImageView alloc] init];
        [self addSubview:self.courFlagImageView];

        
        [self layout];
    }
    return self;
}

- (void)layout {
    [self.V_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset(0);
        make.left.equalTo(self.mas_left).with.offset(30);
    }];
    
    [self.N_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.K_Label.mas_bottom).offset(0);
        make.left.equalTo(self.V_Label.mas_right).offset(30);
    }];
    
    [self.K_Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.M_ImageView.mas_bottom).offset(0);
        make.width.mas_equalTo(self.frame.size.width - 50);
        make.left.equalTo(self.mas_left).with.offset(30);
    }];
    
    [self.courFlagImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.V_Label.mas_right).offset(10);
        make.centerY.equalTo(self.V_Label.mas_bottom);
    }];
    
    [self.M_ImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.courFlagImageView.mas_bottom).offset(15);
        make.right.equalTo(self.mas_right).offset(-50);
        make.left.equalTo(self.mas_left).offset(20);
    }];

}

- (void)setModel:(FDTModel *)model {
    _model = model;
    self.V_Label.text = model.gymName;
    self.K_Label.text = model.courseName;
    self.N_Label.text = model.address;
    self.courFlagImageView.image = [UIImage imageNamed:[model.isAnytime isEqualToString:@"1"] ? @"899_03" : nil];
    self.M_ImageView.image = model.courseImage.length > 0? [UIImage imageNamed:model.courseImage]:nil;
}

- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.V_Label sizeThatFits:size].height;
    totalHeight += [self.K_Label sizeThatFits:size].height;
    totalHeight += [self.M_ImageView sizeThatFits:size].height;
    totalHeight += [self.N_Label sizeThatFits:size].height;
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}



@end
