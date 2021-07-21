//
//  HotelViewModelTests.swift
//  MyHotelsTests
//
//  Created by Jeevan on 21/07/21.
//

import XCTest
@testable import MyHotels

class HotelViewModelTests: XCTestCase {
    
    var sut: HotelViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let hotel1 = Hotel(name: "Hayat Park", address: "Hyderabad", dateOfStay: Date(), pricePerDay: 6999.0, rating: .five, photo: nil)
        sut = HotelViewModel(model: hotel1)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNameOfTheHotel() {
        XCTAssertEqual("Hayat Park", sut.nameOfTheHotel.string)
    }
    
    func testRating() {
        XCTAssertEqual(sut.rating.string, "Rating: 5 stars")
    }
    
    func testAddress() {
        XCTAssertEqual(sut.address, "Hyderabad")
    }
    
    func testPricePerDay() {
        XCTAssertEqual(sut.pricePerDay, "6999.0")
    }
    
    func testRatingSelected() {
        XCTAssertEqual(sut.ratingSelected, .five)
    }

}
