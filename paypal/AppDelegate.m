//
//  AppDelegate.m
//  paypal
//
//  Created by student on 10/17/17.
//  Copyright © 2017 student. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [PayPalMobile initializeWithClientIdsForEnvironments:@{PayPalEnvironmentProduction:@"YOUR_CLIENT_ID_FOR_PRODUCTION",PayPalEnvironmentSandbox:@"YOUR_CLIENT_ID_FOR_SANDBOX"}];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
  }


- (void)applicationDidEnterBackground:(UIApplication *)application {
   }


- (void)applicationWillEnterForeground:(UIApplication *)application {
   
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
   
}


- (void)applicationWillTerminate:(UIApplication *)application {
 

@end
