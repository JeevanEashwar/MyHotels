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
}
