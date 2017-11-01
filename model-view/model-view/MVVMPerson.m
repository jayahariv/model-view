//
//  MVVMPerson.m
//  model-view
//
//  Created by Jayahari Vavachan on 11/1/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import "MVVMPerson.h"

@interface MVVMPerson ()
@property (nonatomic, readwrite) NSString* name;
@property (nonatomic, readwrite) NSString* age;
@property (nonatomic, readwrite) NSString* city;
@property (nonatomic, readwrite) NSString* country;
@end

@implementation MVVMPerson

- (id)initWithName:(NSString *)name
               age:(NSString*)age
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
