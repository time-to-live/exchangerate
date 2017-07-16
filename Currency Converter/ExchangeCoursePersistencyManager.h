//
//  ExchangeCoursePersistencyManager.h
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"
#import "ExchangeCourse.h"

@interface ExchangeCoursePersistencyManager : NSObject

- (ExchangeCourse *) courseFromCurrency:(Currency *) fromCurrency toCurrency:(Currency *)toCurrency;
@end
