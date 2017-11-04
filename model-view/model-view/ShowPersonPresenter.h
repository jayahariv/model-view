//
//  ShowPersonPresenter.h
//  model-view
//
//  Created by Jayahari Vavachan on 11/4/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ShowPersonPresenter : NSObject
- (void)setName:(UILabel*)name age:(UILabel*)age city:(UILabel*)city country:(UILabel*)country;
- (void)showActivePerson;
@end
