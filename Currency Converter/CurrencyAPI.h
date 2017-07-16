//
//  CurrencyAPI.h
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Currency.h"

@interface CurrencyAPI : NSObject

+ (CurrencyAPI *) sharedInstance;

- (NSArray *) currencies;
@end
