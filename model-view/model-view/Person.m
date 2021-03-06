//
//  Person.m
//  model-view
//
//  Created by Jayahari Vavachan on 10/31/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import "Person.h"

@interface Person ()
@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, readwrite) NSNumber* age;
@property (nonatomic, readwrite) NSString* city;
@property (nonatomic, readwrite) NSString* country;
@end

@implementation Person

- (id)initWithName:(NSString *)name
               age:(NSNumber*)age
              city:(NSString*)city
           country:(NSString*)country {
    self = [super init];
    _name = name;
    _age = age;
    _city = city;
    _country = country;
    return self;
}
@end
