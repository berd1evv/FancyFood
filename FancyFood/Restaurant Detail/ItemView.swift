//
//  ItemView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

struct ItemView: View {
    var product: Meal
    @State private var count: Int = 0
    
    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 25)
                .fill(.gray)
                .frame(width: 120, height: 120)
            
            
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title2)
                Text("Item description")
            }
            
//            Spacer()
            
            VStack(alignment: .trailing) {
                Text("\(product.price) KGS")
                    .font(.title2)
                Spacer()
                
                StepperView(count: $count)
            }
            
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    ItemView(product: .init())
}
