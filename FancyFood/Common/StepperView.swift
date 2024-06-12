//
//  StepperView.swift
//  FancyFood
//
//  Created by Eldiiar on 12/6/24.
//

import SwiftUI

struct StepperView: View {
    @Binding var count: Int
    var onFirst: (()->())
    var onChange: (()->())
    
    var body: some View {
        HStack {
            if count > 0 {
                Button {
                    count -= 1
                    onChange()
                } label: {
                    Image(systemName: "minus")
                        .foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(.blue)
                        .cornerRadius(20)
                }
                Text("\(count)")
            }
            
            Button {
                if count == 0 {
                    onFirst()
                }
                count += 1
                onChange()
            } label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40)
                    .background(.blue)
                    .cornerRadius(20)
            }
        }
    }
}

#Preview {
    StepperView(count: .constant(0), onFirst: {
        
    }, onChange: {
        
    })
}
