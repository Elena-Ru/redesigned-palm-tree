// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum LocalizedString {
  /// EUR
  internal static let eur = LocalizedString.tr("Localizable", "eur", fallback: "EUR")
  /// JPY
  internal static let jpy = LocalizedString.tr("Localizable", "jpy", fallback: "JPY")
  /// You have converted %f %@ to %f %@. Commission Fee - %f %@.
  internal static func mainViewCommisionFeeMessage(_ p1: Float, _ p2: Any, _ p3: Float, _ p4: Any, _ p5: Float, _ p6: Any) -> String {
    return LocalizedString.tr("Localizable", "main_view_commision_fee_message", p1, String(describing: p2), p3, String(describing: p4), p5, String(describing: p6), fallback: "You have converted %f %@ to %f %@. Commission Fee - %f %@.")
  }
  /// Convert
  internal static let mainViewConvertButtonTitle = LocalizedString.tr("Localizable", "main_view_convert_button_title", fallback: "Convert")
  /// Localizable.strings
  ///   CurrencyConverter
  /// 
  ///   Created by Елена Русских on 2024-03-15.
  internal static let mainViewCurrencyBalancesLabelTitle = LocalizedString.tr("Localizable", "main_view_currency_balances_label_title", fallback: "Currency balances")
  /// OK
  internal static let ok = LocalizedString.tr("Localizable", "ok", fallback: "OK")
  /// USD
  internal static let usd = LocalizedString.tr("Localizable", "usd", fallback: "USD")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension LocalizedString {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
