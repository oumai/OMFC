//
//  Student.h
//  OMFC
//
//  Created by MichaeOu on 2018/4/12.
//  Copyright © 2018年 康美. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bag : NSObject
@property (copy, nonatomic) NSString *name;
@property (assign, nonatomic) double price;
@end



@interface Student : NSObject
@property (copy, nonatomic) NSString *ID;
@property (copy, nonatomic) NSString *desc;
@property (copy, nonatomic) NSString *neewName;
@property (copy, nonatomic) NSString *oldName;
@property (copy, nonatomic) NSString *nameChangedTime;
@property (strong, nonatomic) Bag *bag;
@end





