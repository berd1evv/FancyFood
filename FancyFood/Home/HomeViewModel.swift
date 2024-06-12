//
//  HomeViewModel.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class HomeViewModel: ObservableObject {
    
    @Published var restaurants = [Restaurant]()
    
    func getRestaurants() {
        let db = Firestore.firestore()
        
        db.collection("restaurants").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.restaurants = querySnapshot?.documents.compactMap({
                    try? $0.data(as: Restaurant.self)
                }) ?? []
            }
        }
    }
}
