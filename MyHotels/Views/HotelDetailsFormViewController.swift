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
    let datePicker = UIDatePicker()
    
    // MARK: View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pageTitle = pageJob == .add ? "Add new hotel" : "Edit"
        configure(pageTitle: pageTitle)
        addTapGestureToDismissKeyboard()
        createDatePicker()
    }
    
    // MARK: IBAction methods
    @IBAction func ratingSelected(_ sender: Any) {
    }
    
    @IBAction func uploadPhoto(_ sender: Any) {
    }
    
    @IBAction func saveAndExit(_ sender: Any) {
    }
    
}

/// Date Picker logic
extension HotelDetailsFormViewController {
    private func createDatePicker() {
        // toolbar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(datePicked))
        toolBar.setItems([doneButton], animated: true)
        
        // datepicker
        datePicker.datePickerMode = .date
        if #available(iOS 14, *) {
            datePicker.preferredDatePickerStyle = .wheels
            datePicker.sizeToFit()
        }
        
        dateOfStay.inputAccessoryView = toolBar
        dateOfStay.inputView = datePicker
    }
    
    @objc private func datePicked() {
        // format the picked date to display
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let pickedDate = datePicker.date
        dateOfStay.text = formatter.string(from: pickedDate)
        dateOfStay.endEditing(true)
    }
}
