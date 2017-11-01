//
//  ViewController.m
//  model-view
//
//  Created by Jayahari Vavachan on 10/31/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "DB.h"
#import "PersonModel+CoreDataClass.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *countryTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@end

@implementation ViewController {
    Person* activePerson;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    Person* p = [self fetchPerson];
    [self mvcShow:p];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onTouchUp:(UIButton *)sender {
    [self mvcSave];
    [self mvcShow:activePerson];
}

#pragma mark MVC
/*
     This is the typical MVC saving!!
         add the logic inside the viewcontroller to save to model
 */
- (void)mvcSave {
    // assuming only integer is provided
    activePerson = [[Person alloc] initWithName:self.nameTextField.text
                                            age:[NSNumber numberWithInt:[self.ageTextField.text intValue]]
                                           city:self.cityTextField.text
                                        country:self.countryTextField.text];
    [self save:activePerson];
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

- (void)mvcShow:(Person*)person {
    if (person) {
        self.nameLabel.text = person.name;
        self.ageLabel.text = [NSString stringWithFormat:@"%d", [person.age intValue]];
        self.cityLabel.text = person.city;
        self.countryLabel.text = person.country;
    }
}

- (Person*)fetchPerson {
    // Fetch the devices from pe rsistent data store
    NSManagedObjectContext* context = [[DB instance] context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"PersonModel"];
    NSArray* persons = [[context executeFetchRequest:fetchRequest error:nil] mutableCopy];
    PersonModel* model = persons.firstObject;
    Person* person = [[Person alloc] initWithPersonModel:model];
    return person;
}

@end
