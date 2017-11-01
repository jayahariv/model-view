//
//  ViewControllerViewModel.m
//  model-view
//
//  Created by Jayahari Vavachan on 10/31/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import "ViewControllerViewModel.h"
#import "DB.h"
#import "PersonModel+CoreDataClass.h"

@implementation ViewControllerViewModel

- (MVVMPerson*)fetchPerson {
    // Fetch the devices from pe rsistent data store
    NSManagedObjectContext* context = [[DB instance] context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"PersonModel"];
    NSArray* persons = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    PersonModel* model = persons.firstObject;
    MVVMPerson* person = [[MVVMPerson alloc] initWithName:model.name
                                              age:[[NSNumber numberWithInt:model.age] stringValue]
                                             city:model.city
                                          country:model.country];
    return person;
}

- (MVVMPerson*)savePerson:(NSString*)name
               age:(NSString*)age
              city:(NSString*)city
           country:(NSString*)country {
    NSManagedObjectContext* context = [[DB instance] context];
    NSManagedObject *personModel = [NSEntityDescription insertNewObjectForEntityForName:@"PersonModel"
                                                                 inManagedObjectContext:context];
    [personModel setValue:name forKey:@"name"];
    [personModel setValue:[NSNumber numberWithInt:[age intValue]] forKey:@"age"];
    [personModel setValue:city forKey:@"city"];
    [personModel setValue:country forKey:@"country"];
    
    NSError *error = nil;
    if (![context save:&error]) {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    return [[MVVMPerson alloc] initWithName:name age:age city:city country:country];
}

@end
