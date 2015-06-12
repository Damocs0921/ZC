//
//  AppDelegate.m
//  ZC
//
//  Created by DamocsYang on 6/7/15.
//  Copyright (c) 2015 DamocsYang. All rights reserved.
//

#import "AppDelegate.h"
#import "Config.h"
#import <BmobSDK/Bmob.h>

@interface AppDelegate ()
{
    UINavigationController* _navigationController;
}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /**
     *  首次启动检查
     */
    [self onFirstRun];
    
    /**
     *  注册第三方sdk
     */
    [self registerSDKs];
    
    /**
     *  加载缓存用户信息
     */
    [self loadUserInfo];
    
    /**
     *  配置颜色字体参数
     */
    [self setUIAttributes];
    
    /**
     *  启动视图
     */
    [self initViewControllers];

    return YES;
}


-(void)onFirstRun
{


}

-(void)registerSDKs
{
   [Bmob registerWithAppKey:BMOB_APP_ID];
}

-(void)loadUserInfo
{
    

}

-(void)setUIAttributes
{
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
      THEME_BLUE, NSForegroundColorAttributeName,
      [UIFont systemFontOfSize:16.0], NSFontAttributeName, nil]];
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:11.0f], NSFontAttributeName, nil] forState:UIControlStateNormal];
     NSMutableDictionary *attr = [[NSMutableDictionary alloc] init];
    [attr setValue:THEME_BLUE forKey:NSForegroundColorAttributeName];
    [[UIBarButtonItem appearance] setTitleTextAttributes:attr forState:UIControlStateNormal];
}

-(void)initViewControllers
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.rootViewController = [[ZCRootViewController alloc] init];
    _navigationController = [[UINavigationController alloc] initWithRootViewController:self.rootViewController];
    _navigationController.navigationBarHidden = YES;
    
    self.window.rootViewController = _navigationController;
    [self.window makeKeyAndVisible];
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
