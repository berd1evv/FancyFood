//
//  FoodOrderingView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI
import RealmSwift

struct FoodOrderingView: View {
    @EnvironmentObject var viewModel: RestaurantViewModel
    @State private var showCart: Bool = false
    @StateObject private var cartManager = CartManager.shared
    
    var body: some View {
        ScrollView {
            
            ForEach(viewModel.categories, id: \.id) { item in
                HStack {
                    Text(item.name)
                        .font(.title2)
                    Spacer()
                }
                if let products = viewModel.categoryProducts[item.id ?? ""] {
                    ForEach(products) { product in
                        ItemView(product: product)
                            .environmentObject(cartManager)
                    }
                } else {
                    Text("Loading products...")
                        .font(.subheadline)
                }
            }
            .padding(.horizontal)
            
        }
        .scrollIndicators(.hidden)
        .overlay {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    if cartManager.total != 0 {
                        Button {
                            showCart = true
                        } label: {
                            HStack {
                                Image(systemName: "cart")
                                    .foregroundStyle(.white)
                                Text("\(cartManager.total) KGS")
                                    .foregroundStyle(.white)
                            }
                            .frame(width: 120, height: 40)
                            .background(.blue)
                            .cornerRadius(16)
                            
                        }
                        .frame(alignment: .bottomTrailing)
                    }
                }
                .padding()
                
            }
        }
        .navigationDestination(isPresented: $showCart) {
            CartView()
        }
        
    }
}

#Preview {
    FoodOrderingView()
}
