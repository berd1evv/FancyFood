//
//  CartView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

struct CartView: View {
    @State private var deliveryAddress: String = ""
    @StateObject private var cartManager = CartManager.shared
    @StateObject private var viewModel: CartViewModel = CartViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(cartManager.getCartProducts(), id: \._id) { item in
                    CartItem(cartItem: item)
                        .environmentObject(cartManager)
                }
                
                TextField("Delivery Address", text: $viewModel.address)
                
                
                Text("Total \(cartManager.total)")
                
                Button(action: {
                    Task {
                        await viewModel.order(onSuccess: {
                            DispatchQueue.main.async {
                                presentationMode.wrappedValue.dismiss()
                                cartManager.deleteAll()
                            }
                        })
                    }
                    
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
