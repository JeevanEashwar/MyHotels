//
//  String+Extension.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import Foundation

extension String{
    func convertDoubleToCurrency() -> String? {
        let amount1 = Double(self) ?? 0.0
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_IN")
        return numberFormatter.string(from: NSNumber(value: amount1))
    }
}
