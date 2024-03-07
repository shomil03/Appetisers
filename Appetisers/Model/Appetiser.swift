//
//  Appetiser.swift
//  Appetisers
//
//  Created by Shomil Singh on 25/01/24.
//

import Foundation

struct AppetiserResponse : Codable{
    let request : [Appetiser]
}

struct Appetiser : Codable , Identifiable{
    let id : Int
    let name : String
    let description : String
    let price : Double
    let imageURL : String
    let protein : Int
    let calories : Int
    let carbs : Int
}

struct MockData {
    static let sampleAppetiser = Appetiser(id: 01,
                                        name: "Test Appetiser",
                                        description: "This is description",
                                        price: 1120,
                                        imageURL:"https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r",
                                        protein: 99,
                                        calories: 99,
                                        carbs: 99)
    
    static let appetisers = [sampleAppetiser , sampleAppetiser , sampleAppetiser , sampleAppetiser , sampleAppetiser , sampleAppetiser]
    
    static let order1 = Appetiser(id: 01,
                                           name: "Test Appetiser",
                                           description: "This is description",
                                           price: 1120,
                                           imageURL:"https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r",
                                           protein: 99,
                                           calories: 99,
                                           carbs: 99)
    static let order2 = Appetiser(id: 02,
                                  name: "Test Appetiser",
                                  description: "This is description",
                                  price: 1120,
                                  imageURL:"https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r",
                                  protein: 99,
                                  calories: 99,
                                  carbs: 99)
    static let order3 = Appetiser(id: 03,
                                  name: "Test Appetiser",
                                  description: "This is description",
                                  price: 1120,
                                  imageURL:"https://cdn.fs.teachablecdn.com/iBkHum1RQ6kVVWyzNy0r",
                                  protein: 99,
                                  calories: 99,
                                  carbs: 99)
    
    static let orderItems = [order1 , order2 , order3]
    
}
