//
//  Hotel.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import Foundation

/// Base entity to capture the hotel details
struct Hotel: Codable {
    var name: String
    var dateOfStay: Date
    var pricePerDay: Double
    var rating: Rating
    var photo: Data
}

/// Choosing enumeration for Rating in order to keep the window between 1 and 5.
/// Added benefit - The raw value can be easily changed to String in future (Ex: Poor, Average, Good, Great and Splendid)
enum Rating: Int, Codable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
}
