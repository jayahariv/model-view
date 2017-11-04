//
//  FetchPersonDataViewPresenter.m
//  model-view
//
//  Created by Jayahari Vavachan on 11/4/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import "FetchPersonDataViewPresenter.h"
#import "DB.h"
#import "Person.h"

@interface FetchPersonDataViewPresenter ()
@property (nonatomic, weak) UITextField* name;
@property (nonatomic, weak) UITextField* age;
@property (nonatomic, weak) UITextField* city;
@property (nonatomic, weak) UITextField* country;
@end

@implementation FetchPersonDataViewPresenter

- (void)setName:(UITextField *)name
            age:(UITextField *)age
           city:(UITextField *)city 
        country:(UITextField *)country {
    self.name = name;
    self.age = age;
    self.city = city;
    self.country = country;
}

- (void)save {
    Person* p = [[Person alloc] initWithName:self.name.text
                                         age:[NSNumber numberWithInt:[self.age.text intValue]]
                                        city:self.city.text
                                     country:self.country.text];
    [self save:p];
}

- (void)save:(Person*)person {
    NSManagedObjectContext* context = [[DB instance] context];
    NSManagedObject *personModel = [NSEntityDescription insertNewObjectForEntityForName:@"PersonModel"
                                                                 inManagedObjectContext:context];
    [personModel setValue:person.name forKey:@"name"];
    [personModel setValue:person.age forKey:@"age"];
    [personModel setValue:person.city forKey:@"city"];
    [personModel setValue:person.country forKey:@"country"];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
}


@end
