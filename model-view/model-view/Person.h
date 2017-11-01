//
//  Person.h
//  model-view
//
//  Created by Jayahari Vavachan on 10/31/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonModel+CoreDataClass.h"

@interface Person : NSObject
@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSNumber* age;
@property (nonatomic, readonly) NSString* city;
@property (nonatomic, readonly) NSString* country;

- (id)initWithName:(NSString *)name
               age:(NSNumber*)age
              city:(NSString*)city
           country:(NSString*)country;

- (id)initWithPersonModel:(PersonModel*)model;

- (void)updateName:(NSString*)name;
- (void)updateAge:(NSNumber*)age;
- (void)updateCity:(NSString*)city;
- (void)updateCountry:(NSString*)country;
@end
