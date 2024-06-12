//
//  RestaurantViewModel.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class RestaurantViewModel: ObservableObject {
    
    @Published var categories = [Category]()
    @Published var categoryProducts: [String: [Meal]] = [:]
    
    
    func getCategories(id: String) {
        guard !id.isEmpty else { return }
        let db = Firestore.firestore()
        
        db.collection("categories").whereField("restaurantID", isEqualTo: id).getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.categories = querySnapshot?.documents.compactMap({
                    try? $0.data(as: Category.self)
                }) ?? []
                self.fetchProducts()
            }
        }
    }
    
    func fetchProducts() {
        let db = Firestore.firestore()
        let productRef = db.collection("products")
        
        for category in categories {
            guard let categoryID = category.id else { continue }
            
            productRef.whereField("categoryID", isEqualTo: categoryID).getDocuments { querySnapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    let products = querySnapshot?.documents.compactMap({
                        try? $0.data(as: Meal.self)
                    }) ?? []
                    
                    self.categoryProducts[categoryID] = products
                }
            }
        }
        
    }
}
