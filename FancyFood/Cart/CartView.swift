//
//  CartView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

struct CartView: View {
    @State private var deliveryAddress: String = ""
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<5, id: \.self) { index in
                    CartItem()
                }
                
                TextField("Delivery Address", text: $deliveryAddress)
                
                Button(action: {
//                    showFoodOrdering = true
                }, label: {
                    HStack {
                        Text("Confirm Order")
                            .foregroundStyle(.white)
                    }
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(16)
                    
                })
                .padding(.top, 16)
            }
        }
        .scrollIndicators(.hidden)
        .padding(.horizontal)
    }
}

#Preview {
    CartView()
}
