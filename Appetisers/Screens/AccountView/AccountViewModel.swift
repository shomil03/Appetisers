//
//  AccountViewModel.swift
//  Appetisers
//
//  Created by Shomil Singh on 04/03/24.
//

import Foundation
import SwiftUI

final class AccountViewModel : ObservableObject{
    @AppStorage("users") var userdata : Data?
    @Published var user = User()
    @Published var isshowingAlert : Bool = false
    @Published var alertItem : AlertItem?
    
    func saveChanges(){
        guard isValid else {
            isshowingAlert = true
            return
        }
        do{
            let data = try JSONEncoder().encode(user)
            userdata = data
            isshowingAlert.toggle()
            alertItem = AlertContext.saveChanges
        }catch{
            isshowingAlert.toggle()
            alertItem = AlertContext.cannotsave
        }
        
    }
    
    func retrieveData(){
        guard let userdata = userdata else {return}
        
        do{
            user = try JSONDecoder().decode(User.self, from: userdata)
        }catch{
            isshowingAlert.toggle()
            alertItem = AlertContext.cannotLoad
        }
    }

    var isValid : Bool{
        guard !user.firstname.isEmpty && !user.lastname.isEmpty && !user.email.isEmpty
        else{
            isshowingAlert.toggle()
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else{
            isshowingAlert.toggle()
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
    }
    
    }
