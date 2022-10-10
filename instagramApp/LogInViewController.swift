//
//  LogInViewController.swift
//  instagramApp
//
//  Created by Kent Brylle Canonigo on 10/10/22.
//

import UIKit
import Parse

class LogInViewController: UIViewController {

    
    @IBOutlet weak var userNameField: UITextField!
    
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = userNameField.text
        user.password = passwordField.text
        
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Sign up unsuccessful: \(error?.localizedDescription)")
            }
            
        }
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = userNameField.text
        let password = passwordField.text
        
        PFUser.logInWithUsername(inBackground: username as! String, password: password as! String)
        {
            (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Log in unsuccessful: \(error?.localizedDescription)")
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
