//
//  UserDefaults+Extension.swift
//  NoteAppCoreData
//
//  Created by Lin Zhang on 8/16/21.
//

import Foundation


extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        
    }
}
