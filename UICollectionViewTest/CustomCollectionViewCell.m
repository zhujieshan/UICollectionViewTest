//
//  CustomCollectionViewCell.m
//  UICollectionViewTest
//
//  Created by zjs on 17/5/3.
//  Copyright © 2017年 zjs. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        [self setUI];
    }
    return self;
}

-(void)setUI{
}

@end
