//
//  Double.swift
//  CryptoCheck
//
//  Created by Anuj Jain on 23/01/25.
//

import Foundation

extension Double {
    
    /// Converts a Double into a Currency with 2-6 Decimal places.
    /// ```
    /// Converts 1234.56 to $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2-6 Decimal places.
    /// ```
    /// Converts 1234.56 to "$1,234.56"
    /// ```
    ///
    func asCurrencyWith2Decimals() -> String
    {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a Currency with 2-6 Decimal places.
    /// ```
    /// Converts 1234.564 to $1,234.564
    /// ```
    private var currencyFormatter6: NumberFormatter{
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current
        formatter.currencyCode = "usd"
        formatter.currencySymbol = "$"
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2-6 Decimal places.
    /// ```
    /// Converts 1234.56 to "$1,234.56"
    /// ```
    ///
    func asCurrencyWith6Decimals() -> String
    {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a percentage as a String with Decimal places.
    /// ```
    /// Converts 27.3454354 to "27.34"
    /// ```
    ///
    func asNumberString() -> String{
        return String(format: "%.2f", self)
    }
    
    func asPercentageString() -> String{
        return asNumberString() + "%"
    }
}
