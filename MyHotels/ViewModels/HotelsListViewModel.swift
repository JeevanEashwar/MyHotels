//
//  HotelsListViewModel.swift
//  MyHotels
//
//  Created by Jeevan on 21/07/21.
//

import Foundation

class HotelsListViewModel {
    var hotels: [Hotel] = []
    
    var numberOfRows: Int {
        hotels.count
    }
    
    func hotel(at index: Int) -> Hotel? {
        if index >= 0 && index < hotels.count {
            return hotels[index]
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
}
