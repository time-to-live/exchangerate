//
//  ExcangeCourseAPI.m
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ExchangeCourseAPI.h"
#import "ExchangeCoursePersistencyManager.h"

@interface ExchangeCourseAPI () {
    ExchangeCoursePersistencyManager * _persistenceManager;
    BOOL _isOnline;
}
@end

@implementation ExchangeCourseAPI

+ (ExchangeCourseAPI *) sharedInstance {
    static ExchangeCourseAPI * _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^ {
        _sharedInstance =[[ExchangeCourseAPI alloc] init];
    });
    return _sharedInstance;
}

- (id) init {
    self = [super self];
    if (self) {
        _persistenceManager = [[ExchangeCoursePersistencyManager alloc] init];
        _isOnline = NO;
    }
    return self;
}
- (ExchangeCourse *) courseFromCurrency:(Currency *) fromCurrency toCurrency:(Currency *)toCurrency {
    if (!_isOnline) {
        return [_persistenceManager courseFromCurrency:fromCurrency toCurrency:toCurrency];
    }
    return nil;
}

@end
