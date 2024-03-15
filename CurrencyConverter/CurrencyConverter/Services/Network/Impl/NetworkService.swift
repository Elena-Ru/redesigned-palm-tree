//
//  NetworkService.swift
//  CurrencyConverter
//
//  Created by Елена Русских on 2024-03-15.
//

// MARK: - NetworkService
final class NetworkService: NetworkServiceProtocol {
    func convert(fromAmount: Double, fromCurrency: Currency, toCurrency: Currency) {
        print("network request")
    }
}
