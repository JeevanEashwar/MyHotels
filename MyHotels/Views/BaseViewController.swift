//
//  BaseViewController.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func configure(pageTitle: String) {
        title = pageTitle
        self.view.addGradientBackgroungColor()
        navigationController?.navigationBar.barTintColor = UIColor.themeColor(type: .dark)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    /// Dismiss keyboard on tapping anywhere in the view
    func addTapGestureToDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.numberOfTapsRequired = 1
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
