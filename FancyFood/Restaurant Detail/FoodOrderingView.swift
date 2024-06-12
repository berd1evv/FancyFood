//
//  FoodOrderingView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

struct FoodOrderingView: View {
    
    @State private var showCart: Bool = false
    
    var body: some View {
        ScrollView {
            
            ForEach(0..<2, id: \.self) { index in
                HStack {
                    Text("Category")
                        .font(.title2)
                    Spacer()
                }
                
                ForEach(0..<5, id: \.self) { index in
                    ItemView()
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
                    Button {
                        showCart = true
                    } label: {
                        HStack {
                            Image(systemName: "cart")
                                .foregroundStyle(.white)
                            Text("450 KGS")
                                .foregroundStyle(.white)
                        }
                        .frame(width: 120, height: 40)
                        .background(.blue)
                        .cornerRadius(16)
                        
                    }
                    .frame(alignment: .bottomTrailing)
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
