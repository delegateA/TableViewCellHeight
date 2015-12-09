//
//  FDTModel.m
//  FDFTemplateLayoutDemo
//
//  Created by zhang_rongwu on 15/8/27.
//  Copyright (c) 2015年 zhang_rongwu. All rights reserved.
//

#import "FDTModel.h"

@implementation FDTModel
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
- (id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}
-(id)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end
