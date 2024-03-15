//
//  MainViewModelProtocol.swift
//  CurrencyConverter
//
//  Created by Елена Русских on 2024-03-15.
//

// MARK: - MainViewModelProtocol
protocol MainViewModelProtocol {
    func makeConvertation(fromAmount: Double, fromCurrency: Currency, toCurrency: Currency)
    func isComission() -> Bool
}
