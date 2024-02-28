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
                Text("\(appetiser.price , specifier: "%.2f")  - Add To Order")
                    .frame(width: 260 , height: 50)
                    .background(Color.brandPrimary)
                    .foregroundStyle(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .fontWeight(.semibold)
                
            })
            .padding()
            
//            Spacer()
            
        }
        .frame(width: 300 , height: 550 )
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 20)
        
        .overlay(Button{
            isshowingDetailView = false
        }label: {
            ZStack{
                Circle()
                    .frame(width: 30 , height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.5)
                    Image(systemName: "xmark")
                    .frame(width: 40 , height: 40)
                    .imageScale(.small)
                    .foregroundStyle(.black)
            }
        }, alignment: .topTrailing)
        
        
    }
}

#Preview {
    DetailView(appetiser: MockData.sampleAppetiser, isshowingDetailView: .constant(true))
}
