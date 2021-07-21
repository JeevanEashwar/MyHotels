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
    
    @IBOutlet weak var ratingButtonsStackView: UIStackView!
    
    var pageJob: PageJob = .add
    let datePicker = UIDatePicker()
    var imagePicker: ImagePicker!
    
    // MARK: View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let pageTitle = pageJob == .add ? "Add new hotel" : "Edit"
        configure(pageTitle: pageTitle)
        addTapGestureToDismissKeyboard()
        createDatePicker()
        imagePicker = ImagePicker(presentationController: self, delegate: self)
    }
    
    // MARK: IBAction methods
    @IBAction func ratingSelected(_ sender: UIButton) {
        let tagSelected = sender.tag
        // Store the selected rating
        let ratingSelected = Rating(rawValue: tagSelected - 1000)
        // update UI
        for subView in ratingButtonsStackView.arrangedSubviews {
            if let button = subView as? UIButton {
                let imageName = (button.tag <= tagSelected) ? "star.fill" : "star"
                button.setImage(UIImage(systemName: imageName), for: .normal)
            }
        }
    }
    
    @IBAction func uploadPhoto(_ sender: UIButton) {
        imagePicker.present(from: sender)
    }
    
    @IBAction func saveAndExit(_ sender: UIButton) {
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

// ImagePicker logic
extension HotelDetailsFormViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        hotelImageView.image = image
    }
}
