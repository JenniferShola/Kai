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

@property (nonatomic) NSTimeInterval timestamp;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic) int16_t type;
@property (nonatomic, retain) NSManagedObject *user;

@end
