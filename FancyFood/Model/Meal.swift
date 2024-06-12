//
//  Meal.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import Foundation
import FirebaseFirestoreSwift

class Meal: Codable, Identifiable {
    @DocumentID var id: String?
    let name: String
    let image: String
    let price: Int
    let categoryID: String
    
    init(name: String, image: String, price: Int, categoryID: String) {
        self.name = name
        self.image = image
        self.price = price
        self.categoryID = categoryID
    }
    
    init() {
        self.name = "name"
        self.image = "img"
        self.price = 0
        self.categoryID = ""
    }
}
