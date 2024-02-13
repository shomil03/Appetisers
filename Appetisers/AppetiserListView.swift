//
//  AppetiserListView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct AppetiserListView: View {
   @StateObject var viewmodel = AppetiserListViewModel()
//    @State var isAlertPresented : Bool = false
    
    var body: some View {
        NavigationStack{
            List(viewmodel.appetizer){appetiser in
                FoodView(appetiser: appetiser)
            
            }
            .tint(Color.brandPrimary)
            .listStyle(.plain)
            .navigationTitle("Appetiser")
        }
        .alert(viewmodel.alertItem?.title ?? Text(""),
               isPresented: $viewmodel.alertIsPresented,
               actions: {
            Button("OK") {
                viewmodel.alertIsPresented = false
            }
        },
               message:  {
            (viewmodel.alertItem?.message ?? Text(""))
        })
        .onAppear{
            viewmodel.getAppetiser()
        }
  
    }
}

#Preview {
    AppetiserListView()
}
