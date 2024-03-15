//
//  UserDefaultsService.swift
//  CurrencyConverter
//
//  Created by Елена Русских on 2024-03-15.
//

import Foundation

// MARK: - UserDefaultsService
final class UserDefaultsService {
    
    // MARK: UserDefaults Keys
    private enum UserDefaultsKeys: String {
        case countCurrencyConversetion
    }
    
    // MARK: Properties
    static let shared = UserDefaultsService()
    private var userDefaults: UserDefaults
    
    // MARK: Initializer
    private init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }
}

// MARK: - Service Protocol
extension UserDefaultsService: UserDefaultsServiceProtocol {
    var countCurrencyConvertation: Int? {
        get {
            userDefaults.integer(forKey: UserDefaultsKeys.countCurrencyConversetion.rawValue)
        }
        
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsKeys.countCurrencyConversetion.rawValue)
        }
    }
}
