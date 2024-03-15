//
//  MainViewModel.swift
//  CurrencyConverter
//
//  Created by Елена Русских on 2024-03-15.
//

// MARK: - MainViewModel
final class MainViewModel {
    
    // MARK: Properties
    var networkService: NetworkServiceProtocol
    var userDefaultsService: UserDefaultsServiceProtocol
    
    // MARK: Initializer
    init(networkService: NetworkServiceProtocol, userDefaultsService: UserDefaultsServiceProtocol) {
        self.networkService = networkService
        self.userDefaultsService = userDefaultsService
    }
}

// MARK: - MainViewModelProtocol
extension MainViewModel: MainViewModelProtocol {
    func makeConvertation(fromAmount: Double, fromCurrency: Currency, toCurrency: Currency) {
        networkService.convert(fromAmount: fromAmount, fromCurrency: fromCurrency, toCurrency: toCurrency)
    }
    
    func isComission() -> Bool {
        countCurrencyConversetion() <= Constants.maxCountOfFreeConvertations ? false : true
    }
}

// MARK: - Private methods
private extension MainViewModel {
    func countCurrencyConversetion() -> Int {
        userDefaultsService.countCurrencyConvertation ?? Constants.initialCountOfConvertations
    }
}

// MARK: - Constants
private extension MainViewModel {
    enum Constants {
        static let maxCountOfFreeConvertations: Int = 5
        static let initialCountOfConvertations: Int = 0
    }
}
