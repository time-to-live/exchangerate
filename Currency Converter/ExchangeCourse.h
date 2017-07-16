//
//  ExchangeCourse.h
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"

@interface ExchangeCourse : NSObject {
    
    Currency * _fromCurrency;
    Currency * _toCurrency;
    double _rate;
}
-(id) initWithFromCurrency:(Currency *) fromCurrency
             andToCurrency:(Currency *) toCurrency
                   andRate:(double) rate;

-(Currency*) fromCurrency;
-(Currency *) toCurrency;
-(double) rate;
@end
