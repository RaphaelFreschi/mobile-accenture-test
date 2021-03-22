//
//  User.swift
//  Marvel APP
//
//  Created by Raphael Freschi on 22/03/21.
//

import Foundation

class User: NSObject {
    
    var userDefaults = UserDefaults.standard
    
    
    var email: String {
        get {
            if let val = userDefaults.string(forKey: "email") {
                return val
                
            } else {
                return ""
            }
        }
        set {
            userDefaults.set(newValue, forKey: "email")
        }
    }

    var password: String {
        get {
            if let val = userDefaults.string(forKey: "password") {
                return val
                
            } else {
                return ""
            }
        }
        set {
            userDefaults.set(newValue, forKey: "password")
        }
    }
}
