//
//  ItemView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI
import Kingfisher

struct RestaurantItemView: View {
    
    var restaurant: Restaurant
    
    var body: some View {
        VStack {
            KFImage(URL(string: restaurant.background))
                .resizable()
                .frame(height: 160)
            
            HStack {
                KFImage(URL(string: restaurant.logo))
                    .resizable()
                    .frame(width: 40, height: 40)
                    .cornerRadius(20)
                Text(restaurant.name)
                Spacer()
                Text("Rating: \(restaurant.rating)")
                Text("Reviews: (\(restaurant.reviews))")
            }
            
        }
    }
}

#Preview {
    RestaurantItemView(restaurant: .init())
}
