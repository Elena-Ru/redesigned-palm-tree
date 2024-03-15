//
//  NetworkServiceMock.swift
//  CurrencyConverterTests
//
//  Created by Елена Русских on 2024-03-15.
//
@testable import CurrencyConverter

// MARK: - NetworkServiceMock
final class NetworkServiceMock: NetworkServiceProtocol {
    
    // MARK: - Properties
    private(set) var convertIsCalled = false
    var lastReceivedFromAmount: Double?
    var lastReceivedFromCurrency: Currency?
    var lastReceivedToCurrency: Currency?
    
    // MARK: - Methods
    func convert(
        fromAmount: Double,
        fromCurrency: CurrencyConverter.Currency,
        toCurrency: CurrencyConverter.Currency) {
        convertIsCalled = true
        lastReceivedFromAmount = fromAmount
        lastReceivedFromCurrency = fromCurrency
        lastReceivedToCurrency = toCurrency
    }
}
