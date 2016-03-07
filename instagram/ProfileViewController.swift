//
//  ProfileViewController.swift
//  instagram
//
//  Created by Ali Hadwan on 3/2/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import Parse


let LogoutNotificationforUser = "LogoutNotificationforUser "


class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogout(sender: AnyObject) {
        // PFUser.currentUser() will now be nil
                PFUser.logOut()
        print("User logged out successfully")

        
       NSNotificationCenter.defaultCenter().postNotificationName(LogoutNotificationforUser , object: nil)


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
