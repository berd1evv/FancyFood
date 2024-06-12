//
//  ItemView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI
import Kingfisher

struct ItemView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Meal
    @State private var count: Int = 0
    
    var body: some View {
        HStack(alignment: .top) {
            KFImage(URL(string: product.image))
                .frame(width: 120, height: 120)
                .cornerRadius(25)
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title2)
                Text("Item description")
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(product.price) KGS")
                    .font(.title2)
                Spacer()
                
                StepperView(count: $count) {
                    cartManager.addProductToCart(product: product, quantity: count, restaurantID: Storage.shared.getRestaurantID())
                } onChange: {
                    if let product = cartManager.getProductByID(id: product.id ?? "") {
                        if count == 0 {
                            cartManager.deleteProductFromCart(product: product)
                        } else {
                            cartManager.updateProductQuantity(product: product, newQuantity: count)
                        }
                    }
                    
                    
                }
            }
            
        }
        .onAppear {
            if let product = cartManager.getProductByID(id: product.id ?? "") {
                count = product.count
                cartManager.total = cartManager.getTotalSum()
            }
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    ItemView(product: .init())
}
