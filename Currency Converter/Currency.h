//
//  Currency.h
//  Currency Converter
//
//  Created by Admin on 16.07.17.
//  Copyright © 2017 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject {
    NSString * _name;
    NSString * _code;
}

-(id)initWithName:(NSString *) name
          andCode:(NSString *) code;

-(NSString *) name;
-(NSString *) code;

@end
