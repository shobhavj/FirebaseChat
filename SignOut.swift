//
//  SignOut.swift
//  ChatApp
//
//  Created by Shobha V J on 2017-11-08.
//  Copyright © 2017 LearnAppMaking. All rights reserved.
//

import UIKit
import Firebase
import KeychainSwift

class SignOutCode: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignOut (_ sender: Any){
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        DataService().keyChain.delete("uid")
        dismiss(animated: true, completion: nil)
    }
    
}


