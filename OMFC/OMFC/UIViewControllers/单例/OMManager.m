//
//  OMManager.m
//  OMFC
//
//  Created by MichaeOu on 2018/4/2.
//  Copyright © 2018年 康美. All rights reserved.
//

#import "OMManager.h"

@implementation OMManager

singletonImplemention(OMManager)


/*ARC
static OMManager *_instance;
+ (instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    if (_instance == nil) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _instance = [[super allocWithZone:zone] init];
        });
    }
    return _instance;
}
- (id)copyWithZone:(NSZone *)zone
{
    return _instance;
}
 */

/*MRC
 static OMManager *_instance;
 + (instancetype)shareInstance
 {
 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{
 _instance = [[self alloc] init];
 });
 return _instance;
 }
 
 + (instancetype)allocWithZone:(struct _NSZone *)zone
 {
 if (_instance == nil) {
 
 static dispatch_once_t onceToken;
 dispatch_once(&onceToken, ^{
 _instance = [[super allocWithZone:zone] init];
 });
 }
 return _instance;
 }
 - (id)copyWithZone:(NSZone *)zone
 {
 return _instance;
 }
 - (id)copyWithZone:(NSZone *)zone
 {
 return instanse;
 }
 - (oneway void)release {}
 - (instancetype)retain {return instance;}
 - (instancetype)autorelease {return instance;}
 - (NSUInteger)retainCount {return ULONG_MAX;}
 
 */


@end
