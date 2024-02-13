//
//  FoodImage.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct FoodImage: View {
    let url : String
    var body: some View {
        AsyncImage(url: URL(string: url)){phase in
            if let image = phase.image{
                image.resizable()
                    .scaledToFit()
                
            }
            else if phase.error != nil{
                Color.red
                
            }
            else{
                ProgressView()
                
            }
            
            
        }
        .frame(width: 120,height: 90)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.trailing)
    }
}

#Preview {
    FoodImage(url:"https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r")
}
