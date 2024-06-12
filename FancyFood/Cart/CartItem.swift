//
//  CartItem.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI
import Kingfisher

struct CartItem: View {
    @EnvironmentObject var cartManager: CartManager
    var cartItem: Cart
    @State private var count: Int = 0
    
    var body: some View {
        HStack(alignment: .top) {
            KFImage(URL(string: cartItem.image))
                .frame(width: 80, height: 80)
                .cornerRadius(16)
            
            Text(cartItem.name)
                .font(.title2)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(cartItem.price) KGS")
                    .font(.title2)
                Spacer()
                
                StepperView(count: $count) {
                    
                } onChange: {
                    if count == 0 {
                        CartManager.shared.deleteProductFromCart(product: cartItem)
                    } else {
                        CartManager.shared.updateProductQuantity(product: cartItem, newQuantity: count)
                    }
                }
                

            }
            
        }
        .onAppear {
            count = cartItem.count
        }
        .padding(.vertical, 12)
    }
}

//#Preview {
//    CartItem()
//}
