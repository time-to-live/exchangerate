//
//  ExcangeCourseAPI.h
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExchangeCourse.h"
#import "Currency.h"

@interface ExchangeCourseAPI : NSObject

+ (ExchangeCourseAPI *) sharedInstance;

- (ExchangeCourse *) courseFromCurrency:(Currency *) fromCurrency toCurrency:(Currency *)toCurrency;

@end
