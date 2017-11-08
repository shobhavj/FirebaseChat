//
//  Constants.swift
//  ChatApp
//
//  Created by Shobha V J on 2017-11-08.
//  Copyright © 2017 Shobha V J. All rights reserved.
//

import Foundation
import Firebase

struct Constants
{
    struct refs
    {
        static let databaseRoot = Database.database().reference()
        static let databaseChats = databaseRoot.child("chats")
    }
}
