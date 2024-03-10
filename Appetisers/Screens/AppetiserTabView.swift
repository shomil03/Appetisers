//
//  ContentView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct AppetiserTabView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        TabView{
            AppetiserListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Account")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }.badge(order.item.count)
        }
        .tint(Color.brandPrimary)
            
    }
}

#Preview {
    AppetiserTabView().environmentObject(Order())
}
