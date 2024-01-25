//
//  FoodView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct FoodView: View {
    let appetiser : Appetiser
    
    var body: some View {
        HStack{
            FoodImage(url: appetiser.imageURL)
            VStack(alignment: .leading , spacing: 5){
                Text(appetiser.name)
                    .font(.title)
                    .fontWeight(.medium)
                Text("$\(appetiser.price , specifier: "%.2f")")
                    .font(.subheadline)
                    .opacity(0.4)
                    .bold()
            }
            .padding(.leading)
            Spacer()
        }
    }
}

#Preview {
    FoodView(appetiser: MockData.sampleAppetiser)
}
