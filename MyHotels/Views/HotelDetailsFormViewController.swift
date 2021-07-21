//
//  HotelDetailsFormViewController.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import UIKit

protocol HotelUpdates: AnyObject {
    func addNewHotel(hotel: Hotel)
    func updateHotel(hotel: Hotel, at index: Int)
}
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
    var indexOfHotel: Int?
    weak var delegate: HotelUpdates?
    
    let datePicker = UIDatePicker()
    var imagePicker: ImagePicker!
    
    var ratingSelected: Rating = .five // default
    var imageData: Data?
    var pickedDate: Date = Date()
    
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
    
    func injectDependencies(pageJob: PageJob, indexOfHotel: Int?, delegate: HotelUpdates) {
        self.pageJob = pageJob
        self.indexOfHotel = indexOfHotel
        self.delegate = delegate
    }
    
    // MARK: IBAction methods
    @IBAction func ratingSelected(_ sender: UIButton) {
        let tagSelected = sender.tag
        // Store the selected rating
        ratingSelected = Rating(rawValue: tagSelected - 1000) ?? .five
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
        let priceEntered = Double(pricePerDay.text ?? "") ?? 0.0
        let newHotelDetails = Hotel(name: name.text ?? "",
                                    dateOfStay: pickedDate,
                                    pricePerDay: priceEntered,
                                    rating: ratingSelected,
                                    photo: imageData)
        switch pageJob {
        case .add:
            delegate?.addNewHotel(hotel: newHotelDetails)
        case .edit:
            delegate?.updateHotel(hotel: newHotelDetails, at: indexOfHotel ?? Int.max)
        }
        self.navigationController?.popViewController(animated: true)
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
        
        pickedDate = datePicker.date
        dateOfStay.text = formatter.string(from: pickedDate)
        dateOfStay.endEditing(true)
    }
}

// ImagePicker logic
extension HotelDetailsFormViewController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        hotelImageView.image = image
        imageData = image?.pngData()
    }
}

// Price validation
extension HotelDetailsFormViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == pricePerDay {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
}
