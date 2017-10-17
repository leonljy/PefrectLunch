//
//  APITests.swift
//  PerfectlunchPackageDescription
//
//  Created by Jeong-Uk Lee on 2017. 10. 17..
//

import XCTest
import Foundation
import Testing
import HTTP

@testable import Vapor
@testable import App

/// This file shows an example of testing
/// routes through the Droplet.

class APITests: TestCase {
    let drop = try! Droplet.testable()
    let controller = RestaurantController()
    
    func testRestaurantsRoutes() throws {
        guard let restaurantOne = try storeNewRestaurant(), let idOne = restaurantOne.id?.int else {
            XCTFail()
            return
        }
        try fetchAll(expectCount: 1)
        try fetchOne(id: idOne)
        try patch(id: idOne)
        try deleteOne(id: idOne)
    }
    
    func fetchAll(expectCount count: Int) throws {
        let req = Request.makeTest(method: .get)
        let res = try controller.index(req).makeResponse()
        
        let json = res.json
        XCTAssertNotNil(json?.array)
        XCTAssertEqual(json?.array?.count, count)
    }
    
    func storeNewRestaurant() throws -> Restaurant? {
        let req = Request.makeTest(method: .post)
        req.json = try JSON(node: ["name": "NC푸코"])
        let res = try controller.store(req).makeResponse()
        
        let json = res.json
        XCTAssertNotNil(json)
        let newId: Int? = try json?.get("id")
        XCTAssertNotNil(newId)
        XCTAssertNotNil(json?["name"])
        XCTAssertEqual(json?["name"], req.json?["name"])
        return try Restaurant.find(newId)
    }
    
    func fetchOne(id: Int) throws {
        let req = Request.makeTest(method: .get)
        let restaurant = try Restaurant.find(id)!
        let res = try controller.show(req, restaurant: restaurant).makeResponse()
        
        let json = res.json
        XCTAssertNotNil(json)
        XCTAssertNotNil(json?["name"])
        XCTAssertNotNil(json?["id"])
        XCTAssertEqual(json?["id"]?.int, id)
        XCTAssertEqual(json?["name"]?.string, "NC푸코")
    }
    
    func deleteOne(id: Int) throws {
        let req = Request.makeTest(method: .delete)
        
        let restaurant = try Restaurant.find(id)!
        _ = try controller.delete(req, restaurant: restaurant)
    }
    
    
    func patch(id: Int) throws {
        let req = Request.makeTest(method: .patch)
        req.json = try JSON(node: ["name": "개화"])
        let restaurant = try Restaurant.find(id)!
        let res = try controller.update(req, restaurant: restaurant).makeResponse()
        
        let json = res.json
        XCTAssertNotNil(json)
        XCTAssertNotNil(json?["name"])
        XCTAssertNotNil(json?["id"])
        XCTAssertEqual(json?["id"]?.int, id)
        XCTAssertEqual(json?["name"]?.string, "개화")
    }
    
    func testRandom() throws {
        guard let restaurantOne = try storeNewRestaurant(), let idOne = restaurantOne.id?.int else {
            XCTFail()
            return
        }
        try drop
            .testResponse(to: .get, at: "restaurants/random")
            .assertStatus(is: .ok)
            .assertJSON("name", equals: "NC푸코")
    }
    
    override func tearDown() {
        super.tearDown()
        try? Restaurant.all().forEach({
            try $0.delete()
        })
    }
}

