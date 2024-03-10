//
//  ViewModel.swift
//  Appetisers
//
//  Created by Shomil Singh on 12/02/24.
//

import SwiftUI
final class AppetiserListViewModel : ObservableObject{
    @Published var appetizer : [Appetiser] = []
    @Published var alertItem : AlertItem?
    @Published var alertIsPresented : Bool = false
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetiser : Appetiser?
    
//    func getAppetiser() {
//        isLoading = true
//        NetworkManager.shared.getAppetizers { result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result{
//                    case .success(let appetisers):
//                        self.appetizer = appetisers
//                    case .failure(let error):
//                        switch error {
//                            case .InvalidData:
//                                self.alertItem = AlertContext.InvalidData
//                            case .invalidURL:
//                                self.alertItem = AlertContext.invalidURL
//                            case .Response:
//                                self.alertItem = AlertContext.Response
//                            case .somethingwentwrong:
//                                self.alertItem = AlertContext.somethingwentwrong
//                        }
//                        self.alertIsPresented = true
//                }
//            }
//            
//        }
//    }
   @MainActor func getAppetiser() async {
        isLoading = true
        
        do{
            appetizer = try await NetworkManager.shared.getAppetizers()
            isLoading = false
        }catch{
            if let apError = error as? ApError{
                switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                    case .InvalidData:
                        alertItem = AlertContext.InvalidData
                    case .Response:
                        alertItem = AlertContext.Response
                    case .somethingwentwrong:
                        alertItem = AlertContext.somethingwentwrong
                }
            }else{
                alertItem = AlertContext.somethingwentwrong
                isLoading = false
            }
        }
    }


    
}
