//
//  HotelDetailsFormViewController.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import UIKit

/// Enumeration to decide the behaviour of HotelDetailsFormViewController
enum PageJob {
    case edit
    case add
}

/// HotelDetailsFormViewController can be used for
///     - adding new hotel details
///     - editing selected hotel details
class HotelDetailsFormViewController: BaseViewController {
    
    // MARK: Outlets
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var dateOfStay: UITextField!
    @IBOutlet weak var pricePerDay: UITextField!
    @IBOutlet weak var hotelImageView: UIImageView!
    
    
    var pageJob: PageJob = .add
    
    // MARK: View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pageTitle = pageJob == .add ? "Add new hotel" : "Edit"
        configure(pageTitle: pageTitle)
        addTapGestureToDismissKeyboard()
    }
    
    // MARK: IBAction methods
    @IBAction func ratingSelected(_ sender: Any) {
    }
    
    @IBAction func uploadPhoto(_ sender: Any) {
    }
    
    @IBAction func saveAndExit(_ sender: Any) {
    }
    
}

extension HotelDetailsFormViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
