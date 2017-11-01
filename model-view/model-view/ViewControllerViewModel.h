//
//  ViewControllerViewModel.h
//  model-view
//
//  Created by Jayahari Vavachan on 10/31/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MVVMPerson.h"

@interface ViewControllerViewModel : NSObject

- (MVVMPerson*)fetchPerson;
- (MVVMPerson*)savePerson:(NSString*)name
               age:(NSString*)age
              city:(NSString*)city
           country:(NSString*)country;

@end
