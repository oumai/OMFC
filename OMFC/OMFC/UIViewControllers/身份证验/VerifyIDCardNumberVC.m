//
//  VerifyIDCardNumberVC.m
//  OMFC
//
//  Created by MichaeOu on 2017/7/13.
//  Copyright © 2017年 康美. All rights reserved.
//

#import "VerifyIDCardNumberVC.h"

@interface VerifyIDCardNumberVC ()

@property (nonatomic, strong) NSDictionary *dictionary;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation VerifyIDCardNumberVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _dictionary = @{@"欧博":@"42062419920501299X",
                    @"欧静":@"420624198809172949",
                    @"欧玉权":@"42062419631008297X",
                    @"刘祥":@"420624199305022917",
                    @"刘诚":@"421087199203022143"};
    
    _textField = [[UITextField alloc] init];
    _textField.frame = CGRectMake(100, 100, 200, 60);
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.text = _dictionary[@"欧博"];
    [self.view addSubview:_textField];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50+60, 200, 60, 50);
    [button setBackgroundImage:[UIImage createImageWithColor:[UIColor cyanColor]] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonVerifyIDClcik:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonVerifyIDClcik:(UIButton *)button
{
    
    _textField.text = [_textField.text isValid] ? _textField.text : _dictionary[@"刘诚"];
    
    BOOL isRight = [self verifyIDCardNumber:_textField.text];
    
    if (!isRight) {
        
        NSLog(@"请输入正确身份证号码");
    }
    else
    {
        NSLog(@"是正确的");
    }
}
/**
 * 身份证号全校验
 */
- (BOOL)verifyIDCardNumber:(NSString *)IDCardNumber
{
    IDCardNumber = [IDCardNumber stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([IDCardNumber length] != 18)
    {
        return NO;
    }
    NSString *mmdd = @"(((0[13578]|1[02])(0[1-9]|[12][0-9]|3[01]))|((0[469]|11)(0[1-9]|[12][0-9]|30))|(02(0[1-9]|[1][0-9]|2[0-8])))";
    NSString *leapMmdd = @"0229";
    NSString *year = @"(19|20)[0-9]{2}";
    NSString *leapYear = @"(19|20)(0[48]|[2468][048]|[13579][26])";
    NSString *yearMmdd = [NSString stringWithFormat:@"%@%@", year, mmdd];
    NSString *leapyearMmdd = [NSString stringWithFormat:@"%@%@", leapYear, leapMmdd];
    NSString *yyyyMmdd = [NSString stringWithFormat:@"((%@)|(%@)|(%@))", yearMmdd, leapyearMmdd, @"20000229"];
    NSString *area = @"(1[1-5]|2[1-3]|3[1-7]|4[1-6]|5[0-4]|6[1-5]|82|[7-9]1)[0-9]{4}";
    NSString *regex = [NSString stringWithFormat:@"%@%@%@", area, yyyyMmdd , @"[0-9]{3}[0-9Xx]"];
    
    NSPredicate *regexTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];if (![regexTest evaluateWithObject:IDCardNumber]){    return NO;}int summary = ([IDCardNumber substringWithRange:NSMakeRange(0,1)].intValue + [IDCardNumber substringWithRange:NSMakeRange(10,1)].intValue) *7+ ([IDCardNumber substringWithRange:NSMakeRange(1,1)].intValue + [IDCardNumber substringWithRange:NSMakeRange(11,1)].intValue) *9+ ([IDCardNumber substringWithRange:NSMakeRange(2,1)].intValue + [IDCardNumber substringWithRange:NSMakeRange(12,1)].intValue) *10+ ([IDCardNumber substringWithRange:NSMakeRange(3,1)].intValue + [IDCardNumber substringWithRange:NSMakeRange(13,1)].intValue) *5+ ([IDCardNumber substringWithRange:NSMakeRange(4,1)].intValue + [IDCardNumber substringWithRange:NSMakeRange(14,1)].intValue) *8+ ([IDCardNumber substringWithRange:NSMakeRange(5,1)].intValue + [IDCardNumber substringWithRange:NSMakeRange(15,1)].intValue) *4+ ([IDCardNumber substringWithRange:NSMakeRange(6,1)].intValue + [IDCardNumber substringWithRange:NSMakeRange(16,1)].intValue) *2+ [IDCardNumber substringWithRange:NSMakeRange(7,1)].intValue *1 + [IDCardNumber substringWithRange:NSMakeRange(8,1)].intValue *6+ [IDCardNumber substringWithRange:NSMakeRange(9,1)].intValue *3;NSInteger remainder = summary % 11;NSString *checkBit = @"";NSString *checkString = @"10X98765432";checkBit = [checkString substringWithRange:NSMakeRange(remainder,1)];
    return [checkBit isEqualToString:[[IDCardNumber substringWithRange:NSMakeRange(17,1)] uppercaseString]];
}

@end
