//
//  CardClassSchedule.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 23/05/22.
//

import Foundation


struct CalendarClass {
    var key : String
    var classes : [Classes]
    
    init(){
        self.key = ""
        self.classes = [Classes]()
    }
}

struct Classes {
    var instructor: Instructor
    var textoEspecial, hour, tipo, fecha: String
    
    init(){
        self.instructor = Instructor()
        self.textoEspecial = ""
        self.hour = ""
        self.tipo = ""
        self.fecha = ""
    }
}

struct Instructor {
    var id: Int
    var nombre: String
    var facePhoto: String
    
    init(){
        self.id = 0
        self.nombre = ""
        self.facePhoto = ""
    }
}

