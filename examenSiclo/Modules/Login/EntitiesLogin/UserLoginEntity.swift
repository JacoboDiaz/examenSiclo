//
//  UserLoginEntity.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 21/05/22.
//

import Foundation

open class UserLoginEntity{
    var email : String
    var password : String
    
    init(email : String, password : String){
        self.email = email
        self.password = password
    }
}
