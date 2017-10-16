//
//  PathfinderLunchTests.swift
//  PerfectlunchPackageDescription
//
//  Created by Jeong-Uk Lee on 2017. 10. 10..
//

import XCTest
import Foundation
import Testing
import HTTP
@testable import Vapor
@testable import App

/// This file shows an example of testing
/// routes through the Droplet.

class PerfectLunchTests: TestCase {
    
    func testRandomSelect() {
        var lunch = Lunch()
        let restaurant = Restaurant(name: "유가네")
        lunch.add(restaurant: restaurant)
        let restaurantSaved: Restaurant = lunch.randomRestaurant!
        XCTAssertNotNil(restaurantSaved)
    }
    
    func testRestaurantEquality() {
        let restaurant1 = Restaurant(name: "팔미")
        let restaurant2 = Restaurant(name: "팔미")
        let restaurant3 = Restaurant(name: "소다미")
        XCTAssertEqual(restaurant1, restaurant2)
        XCTAssertNotEqual(restaurant1, restaurant3)
    }
    
    func testAddRestaurant() {
        var lunch = Lunch()
        let restaurant = Restaurant(name: "유가네")
        lunch.add(restaurant: restaurant)
        XCTAssertNotNil(lunch["유가네"])
        let restaurant2 = Restaurant(name: "김가네")
        lunch.add(restaurant: restaurant2)
        XCTAssertNotNil(lunch["김가네"])
    }
    
    func testModifyRestaurant() {
        var lunch = Lunch()
        let restaurant = Restaurant(name: "유가네")
        lunch.add(restaurant: restaurant)
        lunch.modify(from: restaurant, to: Restaurant(name: "맥도날드"))
        XCTAssertNil(lunch["유가네"])
        XCTAssertNotNil(lunch["맥도날드"])
    }
    
    func testRemoveRestaurant() {
        var lunch = Lunch()
        let restaurant = Restaurant(name: "유가네")
        lunch.add(restaurant: restaurant)
        lunch.remove(restaurant: Restaurant(name: "유가네"))
        XCTAssertNil(lunch["유가네"])
    }
    
    func testGetRestaurant() {
        var lunch = Lunch()
        let restaurant = Restaurant(name: "유가네")
        lunch.add(restaurant: restaurant)
        let result = lunch["유가네"]
        XCTAssertEqual(restaurant, result)
    }

    func testCreateAndRead() throws {
        let restaurant: Restaurant = Restaurant(name: "고추장 불고기")
        try restaurant.save()
        
        let restaurantSaved = try Restaurant.all().first
        
        XCTAssertEqual(restaurant, restaurantSaved)
    }
    
    func testUpdate() throws {
        let restaurant: Restaurant = Restaurant(name: "고추장")
        try restaurant.save()
        
        let restaurantSaved = try Restaurant.all().first!
        XCTAssertEqual(restaurant, restaurantSaved)
        
        restaurantSaved.name = "고추장 불고기"
        try restaurantSaved.save()
        
        let restaurantUpdated = try Restaurant.all().first!
        XCTAssertEqual(Restaurant(name: "고추장 불고기"), restaurantUpdated)
    }
    
    override func tearDown() {
        super.tearDown()
        
        try? Restaurant.all().forEach({
            try $0.delete()
        })
    }
}
