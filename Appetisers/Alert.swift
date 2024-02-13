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
}
