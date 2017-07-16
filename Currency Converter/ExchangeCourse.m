//
//  ExchangeCourse.m
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ExchangeCourse.h"

@implementation ExchangeCourse
-(id) initWithFromCurrency:(Currency *) fromCurrency
             andToCurrency:(Currency *) toCurrency
                   andRate:(double) rate
{
    self = [super init];
    if (self) {
        _fromCurrency = fromCurrency;
        _toCurrency = toCurrency;
        _rate = rate;
    }
    return self;
}
-(Currency*) fromCurrency {
    return _fromCurrency;
}
-(Currency *) toCurrency {
    return _toCurrency;
}
-(double) rate {
    return _rate;
}
@end
