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
    private let defaultValue: T?

    init(key: String, defaultValue: T?) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T? {
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



struct UserDefaultsManager {
    @UserDefaultWrapper(key: "damagochiList", defaultValue: Damagochis().items)
    static var damagochiList: [Damagochi]?

}
