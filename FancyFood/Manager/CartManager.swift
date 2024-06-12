//
//  CartManager.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import Foundation
import RealmSwift

class CartManager: ObservableObject {
    
    @Published var total: Int = 0
    
    static let shared = CartManager()
    
    private init() {}
        
    func addProductToCart(product: Meal, quantity: Int, restaurantID: String) {
        let realm = try! Realm()
        let cartProduct = Cart(_id: product.id ?? "", name: product.name, image: product.image, price: product.price, count: quantity, restaurantID: restaurantID)
        
        // Write to Realm database
        try! realm.write {
            realm.add(cartProduct)
        }
        total = getTotalSum()
    }
    
    func getTotalSum() -> Int {
        let realm = try! Realm()
        let products = realm.objects(Cart.self)
        return products.reduce(0) { $0 + ($1.price * $1.count) }
    }
    
    func getProductByID(id: String) -> Cart? {
        let realm = try! Realm()
        return realm.object(ofType: Cart.self, forPrimaryKey: id)
    }
    
    func getCartProducts() -> Results<Cart> {
        let realm = try! Realm()
        return realm.objects(Cart.self).where { $0.restaurantID == Storage.shared.getRestaurantID() }
    }
    
    func updateProductQuantity(product: Cart, newQuantity: Int) {
        let realm = try! Realm()
        try! realm.write {
            product.count = newQuantity
        }
        total = getTotalSum()
    }
    
    func deleteProductFromCart(product: Cart) {
        let realm = try! Realm()
        try! realm.write {
            realm.delete(product)
        }
        total = getTotalSum()
    }
    
    func deleteAll() {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        total = getTotalSum()
    }
    
}
