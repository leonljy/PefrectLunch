//
//  PerfectLunchLibrary.swift
//  PerfectLunch
//
//  Created by Jeong-Uk Lee on 2017. 8. 8..
//
//
import Foundation
import Random
import FluentProvider

public struct Lunch {
    public init() {
        
    }
    
    var randomRestaurant: Restaurant? {
        return (try? Restaurant.all())?.random
    }
    
    @discardableResult
    mutating func add(restaurant: Restaurant) -> (Bool, Restaurant) {
        do {
            try restaurant.save()
        } catch {
            return (false, restaurant)
        }
        return (true, restaurant)
    }

    @discardableResult
    mutating func remove(restaurant: Restaurant) -> Restaurant? {
        do {
            let deleted = try Restaurant.makeQuery().filter("name", .equals, restaurant.name).first()
            try deleted?.delete()
        } catch {
            
        }
        return restaurant
    }
    
    mutating func modify(from: Restaurant, to: Restaurant) {
        do {
            let restaurant = try Restaurant.makeQuery().filter("name", .equals, from.name).first()
            restaurant?.name = to.name
            try restaurant?.save()
        } catch {
            
        }
    }
    
    subscript(name: String) -> Restaurant? {
        return (try? Restaurant.all())?.first { (obj) -> Bool in
            return obj.name == name
        }
    }
}
