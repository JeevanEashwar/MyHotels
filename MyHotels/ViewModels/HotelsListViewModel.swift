//
//  HotelsListViewModel.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import Foundation

class HotelsListViewModel {
    var hotels: [Hotel] = [Hotel(name: "Ramada", address: "Mumbai", dateOfStay: Date(), pricePerDay: 3200.0, rating: .four, photo: nil)]
    
    var numberOfRows: Int {
        hotels.count
    }
    
    func hotel(at index: Int) -> Hotel? {
        if index >= 0 && index < hotels.count {
            return hotels[index]
        }
        return nil
    }
    
    @discardableResult
    func removeHotel(at index: Int) -> Hotel? {
        if index >= 0 && index < hotels.count {
            let removedHotel = hotels.remove(at: index)
            reloadUI?()
            return removedHotel
        }
        return nil
    }
    
    var reloadUI: (() -> ())?
    
    func addNewHotel(hotel: Hotel) {
        hotels.append(hotel)
        reloadUI?()
    }
    
    func updateHotel(hotel: Hotel, at index: Int) {
        if index >= 0 && index < hotels.count {
            hotels[index] = hotel
            reloadUI?()
        }
    }
    
    func hotelViewModel(at index: Int) -> HotelViewModel? {
        if index >= 0 && index < hotels.count {
            return HotelViewModel(model: hotels[index])
        }
        return nil
    }
}
