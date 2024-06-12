//
//  Category.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import Foundation
import FirebaseFirestoreSwift

class Category: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let image: String
    let restaurantID: String
    
    init(name: String, image: String, restaurantID: String) {
        self.name = name
        self.image = image
        self.restaurantID = restaurantID
    }
    
    init() {
        self.name = "name"
        self.image = ""
        self.restaurantID = ""
    }
}
