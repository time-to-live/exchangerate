//
//  Currency.m
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import "Currency.h"

@implementation Currency

-(id)initWithName:(NSString *) name
          andCode:(NSString *) code {
    self = [super init];
    if (self) {
        _name = name;
        _code = code;
    }
    return self;
}
-(NSString *)name {
    return _name;
}

-(NSString *)code {
    return _code;
}

@end
