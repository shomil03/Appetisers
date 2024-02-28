//
//  AppetiserListView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct AppetiserListView: View {
   @StateObject var viewmodel = AppetiserListViewModel()
    @State var isShowingDetailView = false
    @State private var selectedAppetiser : Appetiser?
    
    var body: some View {
        
        ZStack {
            NavigationStack{
                ZStack{
                    if viewmodel.isLoading{
                        ProgressView()
                            .tint(Color.brandPrimary)
                            .scaleEffect(4)
                    }
                    List(viewmodel.appetizer){appetiser in
                        FoodView(appetiser: appetiser)
                            .onTapGesture {
                                selectedAppetiser = appetiser
                                isShowingDetailView = true
                                
                            }
                        
                    }
                    .disabled(isShowingDetailView)
                    
                    .tint(Color.brandPrimary)
                    .listStyle(.plain)
                    .navigationTitle("Appetiser")
                }
            }
            .blur(radius: isShowingDetailView ? 10 : 0.0)
            
            
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
            if(isShowingDetailView)
            {
                DetailView(appetiser: selectedAppetiser!, isshowingDetailView: $isShowingDetailView)
            }
            
            
        }
        
    }
}

#Preview {
    AppetiserListView()
}
