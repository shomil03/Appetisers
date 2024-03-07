//
//  Order.swift
//  Appetisers
//
//  Created by Shomil Singh on 07/03/24.
//

import SwiftUI

final class Order : ObservableObject{
    
    @Published var item : [Appetiser] = []
    
    var totalPrice : Double{
        item.reduce(0) {$0 + $1.price}
    }
    
    func add(_ appetiser : Appetiser){
        item.append(appetiser)
    }
    
    func deleteOrder(at offset : IndexSet){
        item.remove(atOffsets: offset)
    }
}
