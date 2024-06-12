//
//  CartItem.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

struct CartItem: View {
    @State private var count: Int = 0
    
    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.gray)
                .frame(width: 80, height: 80)
            
            Text("Item")
                .font(.title2)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("120 KGS")
                    .font(.title2)
                Spacer()
                
                StepperView(count: $count) {
                    CartManager.shared.addProductToCart(product: product, quantity: count, restaurantID: Storage.shared.getRestaurantID())
                } onChange: {
                    if let product = CartManager.shared.getProductByID(id: product.id ?? "") {
                        if count == 0 {
                            CartManager.shared.deleteProductFromCart(product: product)
                        } else {
                            CartManager.shared.updateProductQuantity(product: product, newQuantity: count)
                        }
                    }
                }
                

            }
            
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    CartItem()
}
