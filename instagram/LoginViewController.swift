//
//  LoginViewController.swift
//  instagram
//
//  Created by Ali Hadwan on 3/1/16.
//  Copyright © 2016 Ali Hadwan. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {
    
    @IBOutlet weak var PasswordField: UITextField!
    @IBOutlet weak var UserNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animateWithDuration(2, delay: 1, options:[UIViewAnimationOptions.AllowUserInteraction,UIViewAnimationOptions.Repeat,UIViewAnimationOptions.Autoreverse], animations: {
            self.view.backgroundColor = self.randomColor()
            self.view.backgroundColor = self.randomColor()
            
            
            
            }, completion:nil )
        
    }


    @IBAction func onlogin(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(UserNameField.text!, password: PasswordField.text!) { (user: PFUser?,error: NSError?) -> Void in
            if user != nil{
                print("you're logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
        
    }
    
    
    @IBAction func onRegister(sender: AnyObject) {
        let newUser = PFUser()
        newUser.username =  UserNameField.text
        newUser.password =  PasswordField.text
        newUser.signUpInBackgroundWithBlock(){ (success: Bool, error: NSError?)-> Void in
            
            if success {
                
                print(" just created a user login to begin")
                
                //self.performSegueWithIdentifier("loginSegue", sender: nil)
                
            }else{
                print(error?.localizedDescription)
                if error?.code == 202{
                    
                    print("user name is taken OR you already signed up")
                }
            }
            
        }
        

        
    }
    
    func randomColor() -> UIColor {
        let randomOrange:CGFloat = CGFloat(drand48())
        let randomyellow:CGFloat = CGFloat(drand48())
        let randomRed:CGFloat = CGFloat(drand48())
        let randomGreen:CGFloat = CGFloat(drand48())

        
        return UIColor(red: randomRed, green: randomOrange, blue: randomGreen, alpha: 8.0)
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(sender: AnyObject) {
        self.view.endEditing(true)
        self.dismissViewControllerAnimated(true, completion: nil)
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
