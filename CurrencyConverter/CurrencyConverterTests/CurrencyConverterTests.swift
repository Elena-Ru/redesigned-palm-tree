//
//  CurrencyConverterTests.swift
//  CurrencyConverterTests
//
//  Created by Елена Русских on 2024-03-15.
//

import XCTest
@testable import CurrencyConverter

final class MainViewModelTests: XCTestCase {
    
    // MARK: - Properties
    var sut: MainViewModel!
    var networkManagerMock: NetworkServiceMock!
    var userDefaultsManagerMock: UserDefaultsServiceMock!
  
    // MARK: - Lifecycle
    override func setUpWithError() throws {
        super.setUp()
        
        let networkManager = NetworkServiceMock()
        networkManagerMock = networkManager
        let userDefaultsManager = UserDefaultsServiceMock()
        userDefaultsManagerMock = userDefaultsManager
        
        sut = MainViewModel(
            networkService: networkManagerMock,
            userDefaultsService: userDefaultsManager
        )
    }

    override func tearDownWithError() throws {
        sut = nil
        networkManagerMock = nil
        
        super.tearDown()
    }

    // MARK: makeConvertation
    func testMainViewModel_makeConvertation_methodConvertIsCalled() {
        sut.makeConvertation(fromAmount: TestData.amount, fromCurrency: TestData.fromCurrency, toCurrency: TestData.toCurrency)
        
        XCTAssertTrue(networkManagerMock.convertIsCalled, "Expected method convert() in networService to be called")
    }
    
    func testMainViewModel_makeConvertation_methodConvertIsCalledWithRightParameters() {
        sut.makeConvertation(fromAmount: TestData.amount, fromCurrency: TestData.fromCurrency, toCurrency: TestData.toCurrency)
        
        XCTAssertEqual(networkManagerMock.lastReceivedFromAmount, TestData.amount, "Expected networkService to receive correct 'amount' from the viewModel")
        XCTAssertEqual(networkManagerMock.lastReceivedFromCurrency, TestData.fromCurrency, "Expected networkService to receive correct 'fromCurrency' from the viewModel")
        XCTAssertEqual(networkManagerMock.lastReceivedToCurrency, TestData.toCurrency, "Expected networkService to receive correct 'toCurrency' from the viewModel")
    }
    
    // MARK: isComission
    func testMainViewModel_isComission_lessThen5_shouldReturnFalse() {
        
        userDefaultsManagerMock.lastCountCurrencyConvertetion = TestData.countOfFreeConvertation
        
        let isFreeConvertation = sut.isComission()
        
        XCTAssertFalse(isFreeConvertation, "Expected convertation should be free of commission")
        
    }
    
    func testMainViewModel_isComission_greaterThen5_shouldReturnTrue() {
        
        userDefaultsManagerMock.lastCountCurrencyConvertetion = TestData.countOFPaidConvertation
        
        let isFreeConvertation = sut.isComission()
        
        XCTAssertTrue(isFreeConvertation, "Expected convertation should be charged with commission")
        
    }
    
    func testMainViewModel_isComission_nil_shouldReturnFalse() {
        
        userDefaultsManagerMock.lastCountCurrencyConvertetion = TestData.countOfNilConvertation
        
        let isFreeConvertation = sut.isComission()
        
        XCTAssertFalse(isFreeConvertation, "Expected convertation should be free of commission")
        
    }

}

// MARK: - TestData
private extension MainViewModelTests {
    enum TestData {
        static let amount: Double = 112.03
        static let fromCurrency: Currency = .EUR
        static let toCurrency: Currency = .USD
        static let countOfFreeConvertation: Int = 5
        static let countOFPaidConvertation: Int = 10
        static let countOfNilConvertation: Int? = nil
    }
}
