//
//  CurrencyAPI.m
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "CurrencyAPI.h"

@interface CurrencyAPI () {
    NSArray * _currencies;
}
@end

@implementation CurrencyAPI
+ (CurrencyAPI *) sharedInstance {
    static CurrencyAPI * _sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^ {
        _sharedInstance =[[CurrencyAPI alloc] init];
    });
    return _sharedInstance;
}

- (id) init {
    self = [super init];
    if (self) {
        Currency * rub = [[Currency alloc] initWithName:@"Рубль РФ" andCode:@"RUB"];
        Currency * eur = [[Currency alloc] initWithName:@"Евро" andCode:@"EUR"];
        Currency * usd = [[Currency alloc] initWithName:@"Доллар США" andCode:@"USD"];
        _currencies = @[rub, eur, usd];
    }
    return self;
}
- (NSArray *) currencies {
    return _currencies;
}
@end
