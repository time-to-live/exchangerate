//
//  ExchangeCoursePersistencyManager.m
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "ExchangeCoursePersistencyManager.h"
#import "CurrencyAPI.h"

@interface ExchangeCoursePersistencyManager () {
    NSMutableArray * courses;
}
@end
@implementation ExchangeCoursePersistencyManager

- (id) init {
    self = [super init];
    Currency * rub;
    Currency * eur;
    Currency * usd;
    for (Currency * currency in [[CurrencyAPI sharedInstance] currencies]) {
        
        if ([[currency code] isEqual:@"RUB"]) {
            rub = currency;
        } else if ([[currency code] isEqual:@"EUR"]) {
            eur = currency;
        } else if ([[currency code] isEqual:@"USD"]) {
            usd = currency;
        }
    }
    // TODO const? exception if !rub | !eur | !usd
    
    if (self) {
        courses = [[NSMutableArray alloc] initWithArray:
                   @[
                     [[ExchangeCourse alloc] initWithFromCurrency:usd andToCurrency:rub andRate:59.88],
                     [[ExchangeCourse alloc] initWithFromCurrency:usd andToCurrency:eur andRate:0.876],
                     [[ExchangeCourse alloc] initWithFromCurrency:eur andToCurrency:rub andRate:68.36],
                     [[ExchangeCourse alloc] initWithFromCurrency:eur andToCurrency:usd andRate:1.1416],
                     [[ExchangeCourse alloc] initWithFromCurrency:rub andToCurrency:usd andRate:0.0167],
                     [[ExchangeCourse alloc] initWithFromCurrency:rub andToCurrency:eur andRate:0.0144]
                    ]
        
                  ];
    }
    
    return self;
}

- (ExchangeCourse *) courseFromCurrency:(Currency *) fromCurrency toCurrency:(Currency *)toCurrency {
    for (ExchangeCourse *course in courses) {
        if ([fromCurrency isEqual: [course fromCurrency]] && [fromCurrency isEqual: [course fromCurrency]]) {
            return course;
        }
    }
    return nil;
}
@end
