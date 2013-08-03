//
//  Interactions.h
//  Kai
//
//  Created by Shola Oyedele on 8/2/13.
//  Copyright (c) 2013 Shola Oyedele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Interactions : NSManagedObject

@property (nonatomic, retain) NSManagedObject *user;
@property (nonatomic) NSTimeInterval timestamp;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic) int16_t type; //Type can be either 1=Phone, 2=Email, 3=Text, 4=Mail, 5=In Person




@end
