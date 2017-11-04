//
//  ShowPersonPresenter.m
//  model-view
//
//  Created by Jayahari Vavachan on 11/4/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import "ShowPersonPresenter.h"
#import "Person.h"
#import "DB.h"

@interface ShowPersonPresenter ()
@property (nonatomic, weak) UILabel* name;
@property (nonatomic, weak) UILabel* age;
@property (nonatomic, weak) UILabel* city;
@property (nonatomic, weak) UILabel* country;
@end

@implementation ShowPersonPresenter

- (void)setName:(UILabel*)name age:(UILabel*)age city:(UILabel*)city country:(UILabel*)country {
    self.name = name;
    self.age = age;
    self.city = city;
    self.country = country;
}

- (void)showActivePerson {
    Person* p = [self fetchPerson];
    [self show:p];
}

- (Person*)fetchPerson {
    // Fetch the devices from pe rsistent data store
    NSManagedObjectContext* context = [[DB instance] context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"PersonModel"];
    NSArray* persons = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    PersonModel* model = persons.lastObject;
    Person* person = [[Person alloc] initWithName:model.name
                                              age:[NSNumber numberWithInt:model.age]
                                             city:model.city
                                          country:model.country];
    return person;
}

- (void)show:(Person*)person {
    self.name.text = person.name;
    self.age.text = [NSString stringWithFormat:@"%d", [person.age intValue]];
    self.city.text = person.city;
    self.country.text = person.country;
}

@end
