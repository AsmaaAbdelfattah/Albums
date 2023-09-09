//
//  User.swift
//  UserAlbums
//
//  Created by Asmaa_Abdelfattah on 16/06/1402 AP.
//

import Foundation
struct User: Decodable {
    var id: Int
    var name: String?
    var username: String?
    var email: String?
    var address: Address
}

struct Address : Decodable{
    var street: String
    var suite:String
    var city: String
    var zipcode: String
}
