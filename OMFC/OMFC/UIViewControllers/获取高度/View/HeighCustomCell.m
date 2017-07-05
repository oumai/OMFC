//
//  HeighCustomCell.m
//  OMFC
//
//  Created by MichaeOu on 2017/7/5.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "HeighCustomCell.h"

@interface HeighCustomCell()


@end
@implementation HeighCustomCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.detailLabel = [TTTAttributedLabel new];
        self.detailLabel.textColor = KHexColor(@"#989898");
        self.detailLabel.lineSpacing = 6.0f;
        self.detailLabel.textAlignment = NSTextAlignmentLeft;
        self.detailLabel.verticalAlignment = TTTAttributedLabelVerticalAlignmentTop;
        self.detailLabel.font = KFontSize(12.0f);
        self.detailLabel.numberOfLines = 0;
        self.detailLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self.contentView addSubview:_detailLabel];
        
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).offset(2);
            make.left.equalTo(self.contentView.mas_left).offset(10);
            make.right.equalTo(self.contentView.mas_right).offset(-14);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-16.0f);
        }];

        
    }
    return self;
}

+ (CGFloat) heightForCellWithString:(NSString *)string {
    
    if (![string isValid]) {
        return 0;
    }
    
    CGFloat bottomSpace = 16;
    
    CGFloat detailHeight = [NSAttributedString contentHeightWithText:string width:CoreWidth - 10 - 14 fontSize:12.0f lineSpacing:6.0f];
    
    return detailHeight + bottomSpace;
}

@end
