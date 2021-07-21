//
//  HotelDetailsFormViewController.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import UIKit

class HotelDetailsFormViewController: BaseViewController {
    var pageJob: PageJob = .add
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pageTitle = pageJob == .add ? "Add new hotel" : "Edit"
        configure(pageTitle: pageTitle)
        addTapGestureToDismissKeyboard()
    }
}

enum PageJob {
    case edit
    case add
}
