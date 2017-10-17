//
//  RestaurantController.swift
//  PerfectlunchPackageDescription
//
//  Created by Jeong-Uk Lee on 2017. 10. 17..
//

import Vapor
import HTTP

final class RestaurantController: ResourceRepresentable {
    
    func index(_ req: Request) throws -> ResponseRepresentable {
        return try Restaurant.all().makeJSON()
    }
    
    func store(_ req: Request) throws -> ResponseRepresentable {
        let post = try req.restaurant()
        try post.save()
        return post
    }
    
    func show(_ req: Request, restaurant: Restaurant) throws -> ResponseRepresentable {
        return restaurant
    }
    
    func delete(_ req: Request, restaurant: Restaurant) throws -> ResponseRepresentable {
        try restaurant.delete()
        return Response(status: .ok)
    }
    
    func update(_ req: Request, restaurant: Restaurant) throws -> ResponseRepresentable {
        // See `extension Post: Updateable`
        try restaurant.update(for: req)

        // Save an return the updated post.
        try restaurant.save()
        return restaurant
    }
    
    func makeResource() -> Resource<Restaurant> {
        return Resource(index: index,
                        store: store,
                        show: show,
                        update: update,
                        destroy: delete
                        )
    }
}




extension Request {
    /// Create a post from the JSON body
    /// return BadRequest error if invalid
    /// or no JSON
    func restaurant() throws -> Restaurant {
        guard let json = json else { throw Abort.badRequest }
        return try Restaurant(json: json)
    }
}

extension Restaurant: ResponseRepresentable {
    
}

extension RestaurantController: EmptyInitializable { }
