//
//  HotelViewModel.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import Foundation
import UIKit

class HotelViewModel {
    var model: Hotel
    
    init(model: Hotel) {
        self.model = model
    }
    
    var nameOfTheHotel: NSAttributedString {
        let name = model.name
        return NSAttributedString(string: name, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 12, weight: .bold)])
        
    }
    
    var rating: NSAttributedString {
        let ratingInt = model.rating.rawValue
        let ratingString = "Rating: \(ratingInt) stars"
        return NSAttributedString(string: ratingString, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10, weight: .regular)])
    }
    
    var hotelImage: UIImage? {
        if let data = model.photo {
            return UIImage(data: data)
        }
        return nil
    }
}
