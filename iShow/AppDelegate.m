//
//  AppDelegate.m
//  iShow
//
//  Created by Phyllis on 16/6/2.
//  Copyright © 2016年 Phyllis. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "SearchViewController.h"
#import "MyTableViewController.h"
#import "BaseNavigationController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    /*--------------标签控制器--------------*/
    
    NSArray *vc_names = @[@"Home",@"Search",@"Message"];
    
    NSMutableArray *navs = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<3; i++) {
        
        Class class = NSClassFromString([NSString stringWithFormat:@"%@ViewController",vc_names[i]]);
        //通过数组创建四个VC类
        UIViewController *vc = [[class alloc]init];
        
        BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:vc];
        
        [navs addObject:nav];
        
    }
    
    //1.获取显示更多的storyBoard
    UIStoryboard *mySB = [ UIStoryboard storyboardWithName:@"MyTableViewController" bundle:[NSBundle mainBundle]];
    
    MyTableViewController *myTVC = [mySB instantiateInitialViewController];
    
    
    BaseNavigationController *navMy = [[BaseNavigationController alloc]initWithRootViewController:myTVC];
    
    [ navs addObject:navMy];
    
    
    UITabBarController *tabVC = [[UITabBarController alloc]init];
    
    tabVC.viewControllers = navs ;

    tabVC.selectedIndex = 0;
    
    self.window.rootViewController = tabVC;

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
