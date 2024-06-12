//
//  Restaurant.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import Foundation
import FirebaseFirestoreSwift

class Restaurant: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let description: String
    let logo: String
    let background: String
    let reviews: Int
    let rating: Int
    
    init(name: String, description: String, logo: String, background: String, reviews: Int, rating: Int) {
        self.name = name
        self.description = description
        self.logo = logo
        self.background = background
        self.reviews = reviews
        self.rating = rating
    }
    
    init() {
        self.name = "name"
        self.description = "description"
        self.logo = "logo"
        self.background = "background"
        self.reviews = 0
        self.rating = 0
    }
}
