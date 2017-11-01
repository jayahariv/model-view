//
//  DB.h
//  model-view
//
//  Created by Jayahari Vavachan on 10/31/17.
//  Copyright © 2017 JayahariV. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface DB : NSObject
@property (nonatomic, readonly) NSManagedObjectContext* context;

+ (id)instance;
@end
