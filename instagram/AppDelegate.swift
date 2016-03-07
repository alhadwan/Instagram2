//
//  AppDelegate.swift
//  instagram
//
//  Created by Ali Hadwan on 3/1/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import Parse


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: nil)


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userLogedout", name: LogoutNotificationforUser, object: nil)
        

        
        Parse.initializeWithConfiguration(
            ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "instagram"
                   configuration.clientKey = "dbvkljbafbujbDBVosvoeF983QHABAFJV"
                configuration.server = "https://alisnstagram.herokuapp.com/parse"
            })
        )
        let currentUser = PFUser.currentUser()

        if currentUser != nil {
            print("Current user detected")
            //change this vc to enable current user logged in feature
            let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")
            // Make the vc the root view controller
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        } else {
            print("no user found")
            let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")
            // Make the vc the root view controller
            window?.rootViewController = vc
            window?.makeKeyAndVisible()
        }

        
        // Override point for customization after application launch.
        return true
    }
    
    func userLogedout() {
        //  print("Notification received")
        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController")
        window?.rootViewController = vc
        print("see you again")
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

