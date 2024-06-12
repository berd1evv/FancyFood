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
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search restaurants", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                List {
                    if !filteredRestaurants.isEmpty {
                        ForEach(filteredRestaurants, id: \.id) { item in
                            RestaurantItemView(restaurant: item)
                                .onTapGesture {
                                    Storage.shared.setRestaurantID(item.id ?? "")
                                    selectedRestaurant = item
                                    showRestaurant = true
                                }
                        }
                    } else {
                        Text("No restaurants found")
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
    
    var filteredRestaurants: [Restaurant] {
           if searchText.isEmpty {
               return viewModel.restaurants
           } else {
               return viewModel.restaurants.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
           }
       }
}

#Preview {
    HomeView()
}
