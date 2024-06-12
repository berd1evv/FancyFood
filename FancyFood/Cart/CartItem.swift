//
//  CartItem.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

struct CartItem: View {
    @State private var count: Int = 0
    
    var body: some View {
        HStack(alignment: .top) {
            RoundedRectangle(cornerRadius: 16)
                .fill(.gray)
                .frame(width: 80, height: 80)
            
            Text("Item")
                .font(.title2)
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text("120 KGS")
                    .font(.title2)
                Spacer()
                
                StepperView(count: $count)
                

            }
            
        }
        .padding(.vertical, 12)
    }
}

#Preview {
    CartItem()
}
