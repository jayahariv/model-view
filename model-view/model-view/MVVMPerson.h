//
//  MVVMPerson.h
//  model-view
//
//  Created by Jayahari Vavachan on 11/1/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVVMPerson : NSObject

@property (nonatomic, readonly) NSString* name;
@property (nonatomic, readonly) NSString* age;
@property (nonatomic, readonly) NSString* city;
@property (nonatomic, readonly) NSString* country;

- (id)initWithName:(NSString *)name
               age:(NSString*)age
              city:(NSString*)city
           country:(NSString*)country;

@end
