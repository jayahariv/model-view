//
//  FetchPersonDataViewPresenter.h
//  model-view
//
//  Created by Jayahari Vavachan on 11/4/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FetchPersonDataViewPresenter : NSObject

- (void)setName:(UITextField*)name
            age:(UITextField*)age
           city:(UITextField*)city
        country:(UITextField*)country;
- (void)save;

@end
