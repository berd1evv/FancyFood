//
//  CartViewModel.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CartViewModel: ObservableObject {
    
    @Published var address: String = ""
    
    func order(onSuccess: (()->())) async {
        let db = Firestore.firestore()
        let items = CartManager.shared.getCartProducts()
        
        do {
            try await db.collection("orders").document(UUID().uuidString).setData([
                "address": address
            ])
            print("Document successfully written!")
            onSuccess()
        } catch {
            print("Error writing document: \(error)")
        }
    }
}
