import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("restaurants/random") { req in
            guard let randomRestaurant = try Restaurant.all().random else {
                throw Abort(.noContent)
            }
            return try randomRestaurant.makeJSON()
        }

        get("plaintext") { req in
            return "Hello, world!"
        }

        // response to requests to /info domain
        // with a description of the request
        get("info") { req in
            return req.description
        }

        get("description") { req in return req.description }
        
        get("restaurants") { req in
            return "Test"
        }
        
        try resource("posts", PostController.self)
        
        try resource("restaurants", RestaurantController.self)
    }
}
