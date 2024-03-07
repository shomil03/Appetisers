//
//  EmptyState.swift
//  Appetisers
//
//  Created by Shomil Singh on 07/03/24.
//

import SwiftUI

struct EmptyState: View {
    let message : String
    let imageName : String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            NavigationStack{
                VStack{
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 150)
                        .padding()
                    Text(message)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
        }
    }
}

#Preview {
    EmptyState(message: "This is long test message written to test what if there is long text", imageName: "empty-order")
}
