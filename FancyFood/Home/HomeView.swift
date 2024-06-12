//
//  ContentView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

enum NavigationDestination {
    case restaurantDetail
    case foodOrdering
    case cart
}

struct HomeView: View {
    @State private var data = ["1", "2", "3", "4"]
    @State private var showRestaurant: Bool = false
    @State private var path = NavigationPath()
    @State private var selectedRestaurant: Restaurant = Restaurant()
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.restaurants, id: \.id) { item in
                    RestaurantItemView(restaurant: item)
                        .onTapGesture {
                            selectedRestaurant = item
                            showRestaurant = true
                        }
                }
            }
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.large)
            .onAppear {
                viewModel.getRestaurants()
            }
            .navigationDestination(isPresented: $showRestaurant) {
                RestaurantView(restaurant: $selectedRestaurant)
            }
        }
        
    }
}

#Preview {
    HomeView()
}
