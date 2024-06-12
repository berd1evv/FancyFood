//
//  RestaurantView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI
import Kingfisher

struct RestaurantView: View {
    
    @Binding var restaurant: Restaurant
    @State private var isFavorite: Bool = false
    @State private var showFoodOrdering: Bool = false
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: RestaurantViewModel = RestaurantViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                KFImage(URL(string: restaurant.background))
                    .resizable()
                    .frame(height: 220)
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            KFImage(URL(string: restaurant.logo))
                                .resizable()
                                .frame(width: 40, height: 40)
                                .cornerRadius(20)
                            
                            Text(restaurant.name)
                                .font(.title)
                        }
                        Spacer()
                        
                        Button {
                            isFavorite.toggle()
                        } label: {
                            if isFavorite {
                                Text("Remove from favorites")
                                    .foregroundStyle(.red)
                            } else {
                                Text("Add to favorites")
                            }
                            
                        }

                    }
                    
                    
                    
                    Text(restaurant.description)
                    
                    let columns = [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]
                    
                    Text("Menu")
                        .font(.title)
                        .padding(.top, 16)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        // Iterate over the data to populate the grid
                        ForEach(0..<6, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 25)
                                .fill(.gray)
                                .frame(height: 140)
                        }
                    }
                    
                    
                    Button(action: {
                        showFoodOrdering = true
                    }, label: {
                        HStack {
                            Text("Order Food")
                                .foregroundStyle(.white)
                        }
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(16)
                        
                    })
                    .padding(.top, 16)
                }
                .padding()
                
            }
        }
        .ignoresSafeArea(.all, edges: .top)
        .scrollIndicators(.hidden)
        .navigationBarBackButtonHidden(true) // Hide the default back button
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss() // Custom back button action
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                        Text("") // Empty text to remove back button text
                    }
                }
            }
        }
        .onAppear {
            viewModel.getCategories(id: restaurant.id ?? "")
        }
        .navigationDestination(isPresented: $showFoodOrdering) {
            FoodOrderingView()
                .environmentObject(viewModel)
        }
        
    }
}

#Preview {
    RestaurantView(restaurant: .constant(.init()))
}
