//
//  Restaurant.swift
//  Perfectlunch
//
//  Created by Jeong-Uk Lee on 2017. 10. 10..
//
import Vapor
import FluentProvider
import HTTP

final class Restaurant: Model {
    var storage = Storage()
    var name: String
    
    /// The column names for `id` and `content` in the database
    struct Keys {
        static let id = "id"
        static let name = "name"
    }
    
    init(name: String) {
        self.name = name
    }
    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set(Restaurant.Keys.name, name)
        return row
    }
    
    init(row: Row) throws {
        name = try row.get(Restaurant.Keys.name)
    }
    
}


extension Restaurant: Preparation {
    /// Prepares a table/collection in the database
    /// for storing Posts
    static func prepare(_ database: Database) throws {
        try database.create(self) { builder in
            builder.id()
            builder.string(Restaurant.Keys.name)
        }
    }
    
    /// Undoes what was done in `prepare`
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }
}

extension Restaurant: Equatable, CustomStringConvertible, Hashable {
    public static func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
        return lhs.name == rhs.name
    }
    
    public var hashValue: Int {
        return self.name.hashValue
    }

    public var description: String {
        return self.name
    }

}

extension Restaurant: JSONConvertible {
    
    convenience init(json: JSON) throws {
        self.init(
            name: try json.get(Restaurant.Keys.name)
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Restaurant.Keys.name, name)
        try json.set(Restaurant.Keys.id, id)
        return json
    }
}

extension Restaurant: Updateable {
    public static var updateableKeys: [UpdateableKey<Restaurant>] {
        return [
            UpdateableKey(Restaurant.Keys.name, String.self) { restaurant, name in
                restaurant.name = name
            }
        ]
    }
}


