//
//  DetailView.swift
//  Appetisers
//
//  Created by Shomil Singh on 16/02/24.
//

import SwiftUI

struct DetailView: View {

    let appetiser : Appetiser
    @Binding var isshowingDetailView : Bool
    
    var body: some View {
        
        VStack {
            FoodImage(url: appetiser.imageURL)
                .scaledToFill()
            
            Text(appetiser.name)
                .font(.title3)
                .fontWeight(.semibold)
                .padding()
            
            Text(appetiser.description)
                .font(.body)
                .opacity(0.5)
                .italic()
                .multilineTextAlignment(.center)
            
            NutritionalView(appetiser: appetiser)
            
            Button(action: {}, label: {
                ButtonView(text: "\(appetiser.price , specifier: "%.2f")  - Add To Order")
                
            })
            .padding()
            
        }
        .frame(width: 300 , height: 550 )
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 20)
        
        .overlay(Button{
            isshowingDetailView = false
        }label: {
            XDismissButton()
        }, alignment: .topTrailing)
        
        
    }
}

#Preview {
    DetailView(appetiser: MockData.sampleAppetiser, isshowingDetailView: .constant(true))
}
