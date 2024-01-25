//
//  AppetiserListView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct AppetiserListView: View {
    var body: some View {
        NavigationStack{
            List(MockData.appetisers){appetiser in
                FoodView(appetiser: appetiser)
            
            }
            .tint(Color.brandPrimary)
            .listStyle(.plain)
            .navigationTitle("Appetiser")
        }
    }
}

#Preview {
    AppetiserListView()
}
