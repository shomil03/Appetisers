//
//  AccountView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewmodel = AccountViewModel()
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Personal Information"){
                    TextField("First Name", text: $viewmodel.user.firstname)
                    TextField("Last Name", text: $viewmodel.user.lastname)
                    TextField("email", text: $viewmodel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
                    DatePicker("Birthday", selection: $viewmodel.user.bday , displayedComponents: .date)
                    
                    Button("Save changes"){
                        viewmodel.saveChanges()
                    }
                }
                Section("Requests"){
                    Toggle("Extra napkin", isOn: $viewmodel.user.napkin)
                    Toggle("Frequent refills", isOn: $viewmodel.user.refills)
                }
                
                
            }.tint(Color.brandPrimary)
                .alert(viewmodel.alertItem?.title ?? Text(""),
                       isPresented: $viewmodel.isshowingAlert,
                       actions: {
                    Button("OK") {
                        viewmodel.isshowingAlert = false
                    }
                },
                       message:  {
                    (viewmodel.alertItem?.message ?? Text(""))
                })
                .navigationTitle("Account")
                .onAppear(perform: {
                    viewmodel.retrieveData()
                })
        }
        
    }
}

#Preview {
    AccountView()
}
