//
//  PerfectLunchLibrary.swift
//  PerfectLunch
//
//  Created by Jeong-Uk Lee on 2017. 8. 8..
//
//
import Foundation

public struct Lunch {
    let items: Set<Restaurant> = [Restaurant(name: "팔미"),
                                  Restaurant(name: "소다미")]
   
    public init() {
        
    }
    
    public var randomRestaurant: Restaurant {
        return Array(self.items)[Int(arc4random_uniform(UInt32(self.items.count)))]
    }
}

public struct Restaurant: Hashable {
    let name: String
    
    public init(name: String) {
        self.name = name
    }
    
    public var hashValue: Int {
        return self.name.hashValue
    }
}

extension Restaurant: Equatable {
    public static func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.name == rhs.name
    }
}


extension Restaurant: CustomStringConvertible {
    public var description: String {
        return self.name
    }
}
