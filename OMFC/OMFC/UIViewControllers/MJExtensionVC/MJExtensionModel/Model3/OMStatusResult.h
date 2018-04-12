//
//  OMModifyStatusResult.h
//  OMFC
//
//  Created by MichaeOu on 2018/4/12.
//  Copyright © 2018年 康美. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface OMStatusResult : NSObject

@property (nonatomic, strong) NSArray *statuses;
@property (nonatomic, strong) NSArray *ads;
@property (nonatomic, copy) NSString *totalNumber;

@end



@interface OMAds : NSObject

@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *url;


@end



@interface OMStatus : NSObject

@property (nonatomic, copy) NSString *text;
@property (nonatomic, strong) User *user;

@end
