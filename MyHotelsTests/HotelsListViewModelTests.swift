//
//  HotelsListViewModelTests.swift
//  MyHotelsTests
//
//  Created by Jeevan on 21/07/21.
//

import XCTest
@testable import MyHotels

class HotelsListViewModelTests: XCTestCase {

    var sut: HotelsListViewModel!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = HotelsListViewModel()
        let hotel1 = Hotel(name: "Hayat Park", address: "Hyderabad", dateOfStay: Date(), pricePerDay: 6999.0, rating: .five, photo: nil)
        let hotel2 = Hotel(name: "Hotel Ramada", address: "Mumbai", dateOfStay: Date(), pricePerDay: 4499.0, rating: .four, photo: nil)
        let hotel3 = Hotel(name: "Ajantha Inn", address: "Chennai", dateOfStay: Date(), pricePerDay: 3999.0, rating: .three, photo: nil)
        sut.hotels = [hotel1, hotel2, hotel3]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNumberOfRows() {
        XCTAssertEqual(sut.numberOfRows, 3, "Expected number of rows does not match with actual")
    }
    
    func testHotelAtIndex() {
        guard let actual = sut.hotel(at: 1)?.name else {
            XCTAssertFalse(true)
            return
        }
        XCTAssertEqual(actual, "Hotel Ramada", "Expected name of the hotel does not match with actual")
        
    }
    
    func testRemoveHotelAtIndex() {
        guard let removedHotelActual = sut.removeHotel(at: 0) else {
            XCTAssertFalse(true)
            return
        }
        XCTAssertEqual(removedHotelActual.name, "Hayat Park", "Expected name of the hotel does not match with actual")
        XCTAssertEqual(sut.numberOfRows, 2, "Expected number of rows does not match with actual")
    }
    
    func testAddNewHotel() {
        let newHotel = Hotel(name: "Central Perk", address: "SFO", dateOfStay: Date(), pricePerDay: 3999.0, rating: .three, photo: nil)
        var reloadUICalled: Bool = false
        let reloadUI: () -> () = {
            reloadUICalled = true
        }
        sut.reloadUI = reloadUI
        sut.addNewHotel(hotel: newHotel)
        
        XCTAssertEqual(sut.numberOfRows, 4, "Expected number of rows does not match with actual")
        XCTAssertTrue(reloadUICalled)
    }
    
    func testUpdateHotel() {
        let newHotel = Hotel(name: "Central Perk", address: "SFO", dateOfStay: Date(), pricePerDay: 3999.0, rating: .three, photo: nil)
        var reloadUICalled: Bool = false
        let reloadUI: () -> () = {
            reloadUICalled = true
        }
        sut.reloadUI = reloadUI
        sut.updateHotel(hotel: newHotel, at: 1)
        
        XCTAssertEqual(sut.numberOfRows, 3, "Expected number of rows does not match with actual")
        XCTAssertTrue(reloadUICalled)
    }
    
    func testHotelViewModelAtIndex() {
        guard let actual = sut.hotelViewModel(at: 0)?.nameOfTheHotel else {
            XCTAssertFalse(true)
            return
        }
        XCTAssertEqual(actual.string, "Hayat Park", "Expected name of the hotel does not match with actual")
    }

}
