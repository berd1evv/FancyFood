//
//  Cart.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import Foundation
import RealmSwift

class Cart: Object {
    @Persisted(primaryKey: true) var _id: String
    @Persisted var name: String
    @Persisted var image: String
    @Persisted var price: Int
    @Persisted var count: Int
    @Persisted var restaurantID: String
    
    init(_id: String, name: String, image: String, price: Int, count: Int, restaurantID: String) {
        super.init()
        self._id = _id
        self.name = name
        self.image = image
        self.price = price
        self.count = count
        self.restaurantID = restaurantID
    }
    
    // Required initializer for Realm
    required override init() {
        super.init()
    }
}

