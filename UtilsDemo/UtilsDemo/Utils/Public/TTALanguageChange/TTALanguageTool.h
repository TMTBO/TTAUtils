//
//  TTALanguageTool.h
//  UtilsDemo
//
//  Created by TobyoTenma on 13/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import <Foundation/Foundation.h>

/*==================== 语言读取 ========================*/

#define TTANSLocalizedString(key) [[TTALanguageTool sharedTool] tta_localizedStringForKey:key];

typedef NS_ENUM(NSInteger, AppLanguage) {
    kAppLanguageCN = 0,
    kAppLanguageEN = 1,
};

@interface TTALanguageTool : NSObject

+ (instancetype)sharedTool;
- (NSString *)getCurrentLanguage;
- (void)setNewLanguage:(AppLanguage)newLanguage;
- (NSString *)tta_localizedStringForKey:(NSString *)key;
@end
