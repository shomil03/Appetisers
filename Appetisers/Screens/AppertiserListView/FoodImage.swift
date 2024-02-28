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
        AsyncImage(url: URL(string: url) ,
                   transaction: .init(animation: .bouncy(duration: 1))){phase in
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
    }
}

#Preview {
    FoodImage(url:"https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r")
}
