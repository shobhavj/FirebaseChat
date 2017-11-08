//
//  RegistrationVC.swift
//  ChatApp
//
//  Created by Shobha V J on 2017-11-08.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistrationVC: UIViewController {
    
   
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblCaution: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func registerButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
        self.lblCaution.text = ""
        
        Auth.auth().createUser(withEmail: self.txtEmail.text!, password: self.txtPassword.text!) { (user, error) in
            if let error = error {
                print(error.localizedDescription)
                self.lblCaution.text = "☹️\n\(error.localizedDescription)"
            }
            else if let user = user {
                print("User in registration  ",user.email!)
                //self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
}
