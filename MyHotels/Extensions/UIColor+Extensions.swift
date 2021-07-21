//
//  UIColor+Extensions.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import UIKit

extension UIColor {
    enum AppThemePalette {
        case dark, medium, light
    }
    
    static func themeColor(type: AppThemePalette) -> UIColor {
        switch type {
        case .dark:
            return UIColor(red: 60/255.0, green: 140/255.0, blue: 192/255.0, alpha: 1.0)
        case .medium:
            return UIColor(red: 195/255.0, green: 232/255.0, blue: 245/255.0, alpha: 1.0)
        case .light:
            return UIColor(red: 239/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        }
    }
}
