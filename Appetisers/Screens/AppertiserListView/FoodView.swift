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
                .frame(width: 120,height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .padding(.trailing)
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
