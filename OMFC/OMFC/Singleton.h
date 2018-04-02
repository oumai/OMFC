
//
//  Singleton.h
//  OMFC
//
//  Created by MichaeOu on 2018/4/2.
//  Copyright © 2018年 康美. All rights reserved.
//

#ifndef Singleton_h
#define Singleton_h

#define singletonInterface(class)    + (instancetype)share##class;

#if __has_feature(objc_arc)
#define singletonImplemention(class)\
static class *_instance;\
+ (instancetype)share##class\
{\
    static dispatch_once_t onceToken;\
    dispatch_once(&onceToken, ^{\
        _instance = [[self alloc] init];\
    });\
    return _instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
    if (_instance == nil) {\
        \
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [[super allocWithZone:zone] init];\
        });\
    }\
    return _instance;\
}\
- (id)copyWithZone:(NSZone *)zone\
{\
    return _instance;\
}


#else
#define singletonImplemention(class)\
static class *_instance;\
+ (instancetype)share##class\
{\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[self alloc] init];\
});\
return _instance;\
}\
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone\
{\
if (_instance == nil) {\
\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{\
_instance = [[super allocWithZone:zone] init];\
});\
}\
return _instance;\
}\
- (id)copyWithZone:(NSZone *)zone\
{\
return _instance;\
}\
- (oneway void)release {}\
- (instancetype)retain {return instance;}\
- (instancetype)autorelease {return instance;}\
- (NSUInteger)retainCount {return ULONG_MAX;}

#endif

#endif /* Singleton_h */
