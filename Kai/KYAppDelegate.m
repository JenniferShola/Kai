//
//  KYAppDelegate.m
//  Kai
//
//  Created by Shola Oyedele on 8/2/13.
//  Copyright (c) 2013 Shola Oyedele. All rights reserved.
//

#import "KYAppDelegate.h"
#import "Users.h"
#import "Interactions.h"
#import "KYMasterViewController.h"

@implementation KYAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    KYMasterViewController *controller = (KYMasterViewController *)navigationController.topViewController;
    controller.managedObjectContext = self.managedObjectContext;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    /*
    Users *userName = [[Users alloc] init];
    [_managedObjectContext insertObject: userName];
    */
    [self saveContext];
    
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Kai" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Kai.sqlite"];
    BOOL firstRun = ![[NSFileManager defaultManager] fileExistsAtPath:[storeURL path]];

    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
if(firstRun)
{
    Users *userName = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:_managedObjectContext];
    [userName setName:@"Shola"];
    [userName setPhoneNumber:@"555-555-1234"];
    [userName setConnection:@"Friend"];
    [userName setEmail:@"sjoyedele@gmail.com"];
    [userName setReminder:60];
    [userName setPhoto:@"awesomeShola.jpg"];
    
    
    userName = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:_managedObjectContext];
    [userName setName:@"Adrian"];
    [userName setPhoneNumber:@"555-555-1235"];
    [userName setConnection:@"Friend"];
    [userName setEmail:@"adrian@gmail.com"];
    [userName setReminder:120];
    [userName setPhoto:@"adrian.jpg"];

    
    userName = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:_managedObjectContext];
    [userName setName:@"Janeth"];
    [userName setPhoneNumber:@"555-555-1236"];
    [userName setConnection:@"Friend"];
    [userName setEmail:@"janeth.moranc@gmail.com"];
    [userName setReminder:180];
    [userName setPhoto:@"janeth.jpg"];
    
    [self saveContext];
    
}
    
    //[self saveContext];
    
    //[userName.interactions methodName] countObjects, For-Loop/Iterate, Sort into Array
    
    NSFetchRequest * request = [[NSFetchRequest alloc] initWithEntityName:@"Users"];
    NSError *e = nil;
    NSArray * users = [_managedObjectContext executeFetchRequest:request  error:&e];
    if (error)
    {
        //do something here
    }
    
    for (Users* key in users) {
        Interactions *i = [[Interactions alloc] init];
        i.timestamp += [[NSDate date] timeIntervalSince1970];
        i.notes = @"It's so cool interacting with you and talking about programming";
        i.type = 2;
        i.user = key;
        [key addInteractionsObject:i];
    }
    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
