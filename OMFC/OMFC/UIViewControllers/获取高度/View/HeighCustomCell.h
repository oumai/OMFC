//
//  HeighCustomCell.h
//  OMFC
//
//  Created by MichaeOu on 2017/7/5.
//  Copyright © 2017年 康美. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeighCustomCell : UITableViewCell
+ (CGFloat) heightForCellWithString:(NSString *)string;

@property (nonatomic, strong) void(^cellBlock)();
@property (nonatomic, strong) UINavigationController *naviVgation;
@property (nonatomic, strong) TTTAttributedLabel *detailLabel;

@end
