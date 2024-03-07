//
//  Alert.swift
//  Appetisers
//
//  Created by Shomil Singh on 14/02/24.
//

import SwiftUI

struct AlertItem : Identifiable{
    let id = UUID()
    let title : Text
    let message : Text
    let dismissButton : Alert.Button
    
}

struct AlertContext {
//    MARK: - Netework Alert
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                      message: Text("Can not fetch data"),
                                      dismissButton: .default(Text("OK")))
    static let InvalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Data is invalid"),
                                       dismissButton: .default(Text("OK")))
    static let Response = AlertItem(title: Text("Server Error"),
                                    message: Text("invalid response from server"),
                                    dismissButton: .default(Text("OK")))
    static let somethingwentwrong = AlertItem(title: Text("Server Error"),
                                              message: Text("Something went wrong"),
                                              dismissButton: .default(Text("OK")))
    
//    MARK: - Account Alert
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                              message: Text("please ensure all fields of the form have been filled out"),
                                              dismissButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                              message: Text("please enter a valid email"),
                                              dismissButton: .default(Text("OK")))
//    MARK: - User Preferences
    
    static let saveChanges = AlertItem(title: Text("Successfully changed!"),
                                        message: Text("Changes have been saved"),
                                        dismissButton: .default(Text("OK")))
    
    static let cannotsave = AlertItem(title: Text("Change was unsuccessfull"),
                                       message: Text("There was a problem while saving . Please try again"),
                                       dismissButton: .default(Text("OK")))
    
    static let cannotLoad = AlertItem(title: Text("Error cannot load user"),
                                       message: Text("There was a problem loading user data"),
                                       dismissButton: .default(Text("OK")))
    
    
    
}
