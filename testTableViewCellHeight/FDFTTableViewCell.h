//
//  FDFTTableViewCell.h
//  FDFTemplateLayoutDemo
//
//  Created by zhang_rongwu on 15/8/27.
//  Copyright (c) 2015年 zhang_rongwu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#import "FDTModel.h"

@interface FDFTTableViewCell : UITableViewCell
@property (nonatomic, strong)  UILabel *V_Label;
@property (nonatomic, strong)  UILabel *K_Label;
@property (nonatomic, strong)  UILabel *N_Label;
@property (nonatomic, strong)  UILabel *F_Label;
@property (nonatomic, strong)  UIImageView *M_ImageView;

@property (nonatomic, strong)UIImageView *courFlagImageView;

@property (nonatomic, strong)FDTModel *model;

@end
