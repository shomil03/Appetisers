//
//  OrderView.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import SwiftUI

struct OrderView: View {
//    @State private var orderItem = MockData.orderItems
    @EnvironmentObject var order : Order
    var body: some View {
        NavigationStack{
            if(order.item.isEmpty){
                EmptyState(message: "you have no item in appetiser. \n Please add items ", imageName: "empty-order")
            }
            else{
                ZStack {
                    VStack{
                        List{
                            ForEach(order.item){
                                appetiser in
                                FoodView(appetiser: appetiser)
                            }
                            .onDelete(perform: { indexSet in
                                order.deleteOrder(at: indexSet)
                            })
                        }
                        Spacer()
                        ButtonView(text: "$\(order.totalPrice , specifier: "%.2f") - Place Order")
                            .padding(.bottom)
                    }
                    .listStyle(.plain)
                    .navigationTitle("Orders")
                }}
        }
        
    }

}

#Preview {
    OrderView().environmentObject(Order())
}
