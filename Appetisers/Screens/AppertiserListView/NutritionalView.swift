//
//  NutritionalView.swift
//  Appetisers
//
//  Created by Shomil Singh on 16/02/24.
//

import SwiftUI

struct NutritionalView: View {
    let appetiser : Appetiser
    var body: some View {
        HStack{
            NutritionalValue(string: "Calories",
                             integer: appetiser.calories)
            NutritionalValue(string: "Carbs",
                             integer: appetiser.carbs)
            NutritionalValue(string: "Protein",
                             integer: appetiser.protein)
        }
    }
}
struct NutritionalValue : View {
    var string : String
    var integer : Int
    var body: some View {
        VStack{
            Text(string)
                .font(.headline)
                .opacity(0.75)
                .padding(.vertical)
            Text("\(integer)")
                .font(.headline)
                .italic()
                .opacity(0.5)
        }
        .padding(.horizontal)
    }
}


#Preview {
    NutritionalView(appetiser: MockData.sampleAppetiser)
}
