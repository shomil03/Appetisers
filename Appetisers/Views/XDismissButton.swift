//
//  XDismissButton.swift
//  Appetisers
//
//  Created by Shomil Singh on 04/03/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30 , height: 30)
                .foregroundStyle(.white)
                .opacity(0.5)
            Image(systemName: "xmark")
                .frame(width: 40 , height: 40)
                .imageScale(.small)
                .foregroundStyle(.black)
        }
    }
}

#Preview {
    XDismissButton()
}
