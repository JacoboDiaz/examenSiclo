//
//  UserSignUpEntity.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 08/06/22.
//

import Foundation

open class UserSignUpEntity{
    
    var firstName : String
    var lastName : String
    var email : String
    var birthday : String
    var lada : String
    var phone : String
    var gender : String
    var country : String
    var height : String
    var weight : String
    var password : String
    var repeat_password : String
    
    init(){
        self.firstName = ""
        self.lastName = ""
        self.email = ""
        self.birthday = ""
        self.lada = ""
        self.phone = ""
        self.gender = ""
        self.country = ""
        self.height = ""
        self.weight = ""
        self.password = ""
        self.repeat_password = ""
    }
}
