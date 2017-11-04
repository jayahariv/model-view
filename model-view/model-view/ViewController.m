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
#import "ViewControllerViewModel.h"
#import "FetchPersonDataViewPresenter.h"
#import "ShowPersonPresenter.h"

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
    ViewControllerViewModel* viewModel;
    FetchPersonDataViewPresenter* fetchViewPresenter;
    ShowPersonPresenter* showPersonPresenter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    MVC
//    Person* p = [self fetchPerson];
//    [self mvcShow:p];
    
//    MVVM
    viewModel = [[ViewControllerViewModel alloc] init];
    [self showPerson];
    
//    MVP
    [self connectFetchPersonDataViewPresenter];
    [self connectShowPersonPresenter];
    [showPersonPresenter showActivePerson];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onTouchUp:(UIButton *)sender {
//    MVC
//    [self mvcSave];
//    [self mvcShow:activePerson];
    
//    MVVM
//    [self saveMVVMPerson];
    
//    MVP
    [fetchViewPresenter save];
    [showPersonPresenter showActivePerson];
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
    Person* person = [[Person alloc] initWithName:model.name
                                              age:[NSNumber numberWithInt:model.age]
                                             city:model.city 
                                          country:model.country];
    return person;
}

#pragma mark MVVM
/*
 Fetch: person from ViewModel-class and view-controller classes will get a valid person object.
     - No DB fetching, No class convertion, Nothing
     - Just get the direct object to display in UI
 Save: will be done inside viewModel
     - will get a saved new object to show it in UI.
 */

- (void)showPerson {
    MVVMPerson* person = [viewModel fetchPerson];
    [self display:person];
}

- (void)display:(MVVMPerson*)person {
    if (person) {
        self.nameLabel.text = person.name;
        self.ageLabel.text = person.age;
        self.cityLabel.text = person.city;
        self.countryLabel.text = person.country;
    }
}

- (void)saveMVVMPerson {
    MVVMPerson* person = [viewModel savePerson:self.nameTextField.text
                      age:self.ageTextField.text
                     city:self.cityTextField.text
                  country:self.countryTextField.text];
    [self display:person];
}

#pragma mark MVP
- (void)connectFetchPersonDataViewPresenter {
    fetchViewPresenter = [[FetchPersonDataViewPresenter alloc] init];
    [fetchViewPresenter setName:self.nameTextField
                            age:self.ageTextField
                           city:self.cityTextField
                        country:self.countryTextField];
}

- (void)connectShowPersonPresenter {
    showPersonPresenter = [[ShowPersonPresenter alloc] init];
    [showPersonPresenter setName:self.nameLabel age:self.ageLabel city:self.cityLabel country:self.countryLabel];
}

@end
