//
//  ButtonView.swift
//  Appetisers
//
//  Created by Shomil Singh on 04/03/24.
//

import SwiftUI

struct ButtonView: View {
    var text : LocalizedStringKey
    var body: some View {
        Text(text)
            .frame(width: 260 , height: 50)
            .background(Color.brandPrimary)
            .foregroundStyle(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .fontWeight(.semibold)
    }
}

#Preview {
    ButtonView(text: "Test title")
}
