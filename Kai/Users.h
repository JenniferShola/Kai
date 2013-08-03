//
//  Users.h
//  Kai
//
//  Created by Shola Oyedele on 8/2/13.
//  Copyright (c) 2013 Shola Oyedele. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Interactions;

@interface Users : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * connection;
@property (nonatomic, retain) NSString * email;
@property (nonatomic) int16_t reminder;
@property (nonatomic) int16_t strength;
@property (nonatomic, retain) NSString * photo;
@property (nonatomic, retain) NSSet *interactions;
@end

@interface Users (CoreDataGeneratedAccessors)

- (void)addInteractionsObject:(Interactions *)value;
- (void)removeInteractionsObject:(Interactions *)value;
- (void)addInteractions:(NSSet *)values;
- (void)removeInteractions:(NSSet *)values;

@end
