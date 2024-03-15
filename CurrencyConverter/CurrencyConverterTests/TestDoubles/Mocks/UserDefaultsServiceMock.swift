//
//  UserDefaultsServiceMock.swift
//  CurrencyConverterTests
//
//  Created by Елена Русских on 2024-03-15.
//

@testable import CurrencyConverter

// MARK: - NetworkServiceMock
final class UserDefaultsServiceMock: UserDefaultsServiceProtocol {
    
    var lastCountCurrencyConvertetion: Int?
    
    var countCurrencyConvertation: Int? {
        get {
            lastCountCurrencyConvertetion
        }
        set {
            lastCountCurrencyConvertetion = newValue
        }
    }
}
