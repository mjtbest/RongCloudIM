//
//  AppDelegate.swift
//  RongCloudIMByXcode_7
//
//  Created by mjt on 15/11/7.
//  Copyright © 2015年 mjt. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    // AppKey
    let appKey = "vnroth0kr9j5o"
    // 用token测试链接
    let token = "08N4O9r7IcKAfuXgVWEOBwZ90rRGIeKyfpX1eZ8GUbQr4TOkMaaXp0Wjh+SK7kedlYb56xwByiPZl904EdMx4A=="
    // 登录用户信息
    let uID = "123"
    let uName = "mjt"
    let uProtrait = "http://img2.imgtn.bdimg.com/it/u=3359865473,1570945789&fm=21&gp=0.jpg"

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        
        return true
    }
    
    func connectServer(completion:() -> Void) {
        RCIM.sharedRCIM().initWithAppKey(self.appKey)
        RCIM.sharedRCIM().connectWithToken(self.token, success: { (_) -> Void in
            RCIMClient.sharedRCIMClient().currentUserInfo = RCUserInfo(userId: self.uID, name: self.uName, portrait: self.uProtrait)
            // 将页面更新操作放到主线程当中执行
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion()
            })
            }, error: { (_) -> Void in
                print("error")
            }) { () -> Void in
                print("other error")
        }
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

