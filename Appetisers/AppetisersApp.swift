//
//  AppetisersApp.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

@main
struct AppetisersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetiserTabView().environmentObject(order)
        }
    }
}
