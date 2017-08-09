//
//  PathfinderLunchTests.swift
//  PerfectLunch
//
//  Created by Jeong-Uk Lee on 2017. 8. 8..
//
//

import XCTest

@testable import PerfectLunchLibrary

class PerfectLunchTests: XCTestCase {
    func testRandomSelect() {
        let lunch = Lunch()
        let restaurant: Restaurant = lunch.randomRestaurant
        XCTAssertNotNil(restaurant)
        XCTAssertTrue(lunch.items.count > 0)
        XCTAssertTrue(lunch.items.contains(restaurant))
    }
    
    func testRestaurantEquality() {
        let restaurant1 = Restaurant(name: "팔미")
        let restaurant2 = Restaurant(name: "팔미")
        let restaurant3 = Restaurant(name: "소다미")
        XCTAssertEqual(restaurant1, restaurant2)
        XCTAssertNotEqual(restaurant1, restaurant3)
    }
}
