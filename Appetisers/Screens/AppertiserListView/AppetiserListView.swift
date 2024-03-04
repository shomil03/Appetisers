//
//  AppetiserListView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct AppetiserListView: View {
   @StateObject var viewmodel = AppetiserListViewModel()
    
    
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
                                viewmodel.selectedAppetiser = appetiser
                                withAnimation{
                                    viewmodel.isShowingDetailView = true
                                }
                                
                            }
                        
                    }
                    .disabled(viewmodel.isShowingDetailView)
                    
                    .tint(Color.brandPrimary)
                    .listStyle(.plain)
                    .navigationTitle("Appetiser")
                }
            }
            .blur(radius: viewmodel.isShowingDetailView ? 10 : 0.0)
            
            
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
            if(viewmodel.isShowingDetailView)
            {
                DetailView(appetiser: viewmodel.selectedAppetiser!, isshowingDetailView: $viewmodel.isShowingDetailView)
            }
            
            
        }
        
    }
}

#Preview {
    AppetiserListView()
}
