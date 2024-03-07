//
//  User.swift
//  Appetisers
//
//  Created by Shomil Singh on 05/03/24.
//

import Foundation
struct User : Codable{
     var firstname : String = ""
     var lastname : String = ""
     var email : String = ""
     var bday : Date = Date.now
     var napkin : Bool = false
     var refills : Bool = false

}
