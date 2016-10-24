//
//  TTASingleton.h
//  TTASingleton_h
//
//  Created by TobyoTenma.
//  Copyright © 2016年 TobyoTenma. All rights reserved.
//

//## 表示字符串和参数拼接
#define TTASingleton_h(name) +(instancetype)shared##name;

#if !__has_feature(objc_arc) // MRC
#define TTASingleton_m(name)                                                   \
                                                                               \
  +(instancetype)shared##name {                                                \
    return [[self alloc] init];                                                \
  }                                                                            \
                                                                               \
  +(instancetype)allocWithZone : (struct _NSZone *)zone {                      \
    static id instance;                                                        \
    static dispatch_once_t onceToken;                                          \
    dispatch_once(&onceToken, ^{                                               \
      instance = [super allocWithZone:zone];                                   \
    });                                                                        \
                                                                               \
    return instance;                                                           \
  }                                                                            \
                                                                               \
  -(id)copyWithZone : (nullable NSZone *)zone {                                \
    return self;                                                               \
  }                                                                            \
                                                                               \
  -(oneway void)release{}                                                      \
                                                                               \
      - (instancetype)autorelease {                                            \
    return self;                                                               \
  }                                                                            \
                                                                               \
  -(NSUInteger)retainCount {                                                   \
    return 1;                                                                  \
  }                                                                            \
                                                                               \
  -(instancetype)retain {                                                      \
    return self;                                                               \
  }
#else // ARC
#define TTASingleton_m(name)                                                   \
                                                                               \
  +(instancetype)shared##name {                                                \
    return [[self alloc] init];                                                \
  }                                                                            \
                                                                               \
  +(instancetype)allocWithZone : (struct _NSZone *)zone {                      \
    static id instance;                                                        \
    static dispatch_once_t onceToken;                                          \
    dispatch_once(&onceToken, ^{                                               \
      instance = [super allocWithZone:zone];                                   \
    });                                                                        \
                                                                               \
    return instance;                                                           \
  }                                                                            \
                                                                               \
  -(id)copyWithZone : (nullable NSZone *)zone {                                \
    return self;                                                               \
  }
#endif /* TTASingleton_h */
