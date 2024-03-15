//
//  NetworkServicePrrotocol.swift
//  CurrencyConverter
//
//  Created by Елена Русских on 2024-03-15.
//

//MARK: - NetworkServicePrrotocol
protocol NetworkServiceProtocol {
    func convert(fromAmount: Double, fromCurrency: Currency, toCurrency: Currency)
}
