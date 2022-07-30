//
//  UserDefaultsManager.swift
//  SesacDamagochi
//
//  Created by Doy Kim on 2022/07/25.
//

import Foundation


@propertyWrapper
struct UserDefaultWrapper<T: Codable> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            if let savedData = UserDefaults.standard.object(forKey: key) as? Data {
                let decoder = JSONDecoder()
                if let loadedObject = try? decoder.decode(T.self, from: savedData) {
                    return loadedObject
                }
            }
            return defaultValue
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                UserDefaults.standard.setValue(encoded, forKey: key)
            }
        }
    }
    
}

@propertyWrapper
struct UserDefault<T> {
    private let key: String
    private let defaultValue: T

    init(key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            // Read value from UserDefaults
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            // Set value to UserDefaults
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

struct UserDefaultsManager {
    @UserDefaultWrapper(key: "damagochiList", defaultValue: Damagochis.items)
    static var damagochiList: [Damagochi]
    
    @UserDefaultWrapper(key: "status", defaultValue: Status.start)
    static var status: Status
    
    @UserDefault(key: "SelectedDamagochiID", defaultValue: 0)
    static var SelectedDamagochiId: Int
    
    @UserDefault(key: "bossName", defaultValue: "대장님")
    static var bossName: String
}


public func cleanCompleteStorage(){
    if let bundleID = Bundle.main.bundleIdentifier {
        UserDefaults.standard.removePersistentDomain(forName: bundleID)
    }
    
}


enum Status: Codable {
    case start
    case edit
}
