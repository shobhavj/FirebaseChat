//
//  LoginVCViewController.swift
//  ChatApp
//
//  Created by Shobha V J on 2017-11-08.
//  Copyright © 2017 Shobha V J. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import KeychainSwift

class LoginVC: UIViewController {

 
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblCaution: UILabel!
  
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let keyChain = DataService().keyChain
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "SignIn", sender: nil)
        }
    }
    func CompleteSignIn(id: String){
        let keyChain = DataService().keyChain
        keyChain.set(id , forKey: "uid")
    }
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener() { (auth, user) in
            print(auth)
            if let user = user {
                print("User    ",user)
                print("User email1 ",user.email!)
                //self.lblCaution.text = "😍\n Logged in with : \(user.email!)"
                
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    @IBAction func btnLoginPressed(_ sender: Any) {
        
        self.view.endEditing(true)
        self.lblCaution.text = ""
        
        if let email = txtEmail.text, let password = txtPassword.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                   self.CompleteSignIn(id: user!.uid)
                    self.performSegue(withIdentifier: "SignIn", sender: nil)
                } else {
                    Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print("cant sign in user")
                        } else {
                          self.CompleteSignIn(id: user!.uid)
                            self.performSegue(withIdentifier: "SignIn", sender: nil)
                        }
                    }
                }
            }
        }
    
        
        
        
        
        
//
//
//        Auth.auth().signIn(withEmail: self.txtEmail.text!, password: self.txtPassword.text!) { (user, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                self.lblCaution.text = "☹️\n\(error.localizedDescription)"
//            }
//            else if let user = user {
//                print("User Email 2",user.email!)
//
//                self.lblCaution.text = "😍\n Logged in with : \(user.email!)"
//            }
//        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
