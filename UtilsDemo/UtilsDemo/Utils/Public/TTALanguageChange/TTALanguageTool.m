//
//  TTALanguageTool.m
//  UtilsDemo
//
//  Created by TobyoTenma on 13/02/2017.
//  Copyright © 2017 TobyoTenma. All rights reserved.
//

#import "TTALanguageTool.h"

static NSArray <NSString *> *_appLanguages = nil;

@implementation TTALanguageTool

+ (instancetype)sharedTool {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[[self class] alloc] init];
        _appLanguages = @[@"zh-Hans", @"en"];
    });
    return instance;
}

- (NSString *)getCurrentLanguage {
    NSString *currentLanguage = [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] firstObject];
    return currentLanguage;
}

- (void)setNewLanguage:(AppLanguage)newLanguage {
    NSUserDefaults *defualt = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defualt objectForKey:@"AppleLanguages"];
    languages = @[[self p_getLanguageWithAppLanguage:newLanguage]];
    [defualt setObject:languages forKey:@"AppleLanguages"];
    [defualt synchronize];
}

- (NSString *)tta_localizedStringForKey:(NSString *)key {
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:[self getCurrentLanguage] ofType:@"lproj"];
    NSBundle *languageBundle = [NSBundle bundleWithPath:bundlePath];
    return NSLocalizedStringFromTableInBundle(key, nil, languageBundle, nil);
}

// MARK:- Private Methods

- (NSString *)p_getLanguageWithAppLanguage:(AppLanguage)appLanguage {
    NSAssert(_appLanguages.count >= appLanguage, @"The app language not currect, please check it");
    return _appLanguages[appLanguage];
}

@end
