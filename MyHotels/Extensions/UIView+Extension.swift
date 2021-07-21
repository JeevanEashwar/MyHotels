//
//  UIView+Extension.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import UIKit

extension UIView {
    func addCardLook() {
        self.layer.cornerRadius = 10.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.layer.shadowRadius = 6.0
        self.layer.shadowOpacity = 0.5
    }
    
    func addGradientBackgroungColor() {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor.themeColor(type: .medium).cgColor, UIColor.themeColor(type: .light).cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        self.layer.insertSublayer(gradient, at: 0)
    }
}
