//
//  AccountView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct AccountView: View {
    @State private var firstname : String = ""
    @State private var lastname : String = ""
    @State private var email : String = ""
    @State private var bday : Date = Date.now
    @State private var napkin : Bool = false
    @State private var refills : Bool = false
    var body: some View {
        NavigationStack{
            Form{
                Section("Personal Information"){
                    TextField("First Name", text: $firstname)
                    TextField("Last Name", text: $lastname)
                    TextField("email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $bday , displayedComponents: .date)
                    
                    Button("Save changes"){
                    }
                }
                Section("Requests"){
                    Toggle("Extra napkin", isOn: $napkin)
                    Toggle("Frequent refills", isOn: $refills)
                }
                
                
            }.tint(Color.brandPrimary)
                .navigationTitle("Account")
        }
        
    }
}

#Preview {
    AccountView()
}
