//
//  FDTModel.h
//  FDFTemplateLayoutDemo
//
//  Created by zhang_rongwu on 15/8/27.
//  Copyright (c) 2015年 zhang_rongwu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FDTModel : NSObject

/** 地址*/
@property (nonatomic, strong)NSString *address;
/** 签到码*/
@property (nonatomic, strong)NSString *checkinCode;
/** 课程编号*/
@property (nonatomic, assign)NSInteger courseId;
/** 课程图片路径*/
@property (nonatomic, strong)NSString *courseImage;
/** 课程名称*/
@property (nonatomic, strong)NSString *courseName;
/** 课程持续时间*/
@property (nonatomic, assign)NSInteger duration;
/** 场馆name*/
@property (nonatomic, strong)NSString *gymName;

@property (nonatomic, strong)NSString *isAnytime;

-(id)initWithDictionary:(NSDictionary *)dic;

@end
