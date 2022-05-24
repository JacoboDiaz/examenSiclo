//
//  ClassSchedule.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 23/05/22.
//

import Foundation

// MARK: - ClassSchedule

struct ClassSchedule : Codable {
    
    struct ClassSchedule : CodingKey {
        var stringValue: String
        init?(stringValue: String) {
          self.stringValue = stringValue
        }
        var intValue: Int? { return nil }
        init?(intValue: Int) { return nil }

        static let fecha = ClassSchedule(stringValue: "fecha")!
      }

      struct Classes : Codable {
        let name: String
        let fecha: String
      }

      let beerStyles : [Classes]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ClassSchedule.self)

        var styles: [Classes] = []
        for key in container.allKeys {
            let nested = try container.nestedContainer(keyedBy: ClassSchedule.self, forKey: key)
            let fecha = try nested.decode(String.self, forKey: .fecha)
            styles.append(Classes(name: key.stringValue, fecha: fecha))
        }

        self.beerStyles = styles
    }
    
    func encode(to encoder: Encoder) throws {
        var container = try encoder.container(keyedBy: ClassSchedule.self)
        for style in beerStyles {
            let key = ClassSchedule(stringValue: style.name)!
            var nested = try container.nestedContainer(keyedBy: ClassSchedule.self,
                forKey: key)
            try nested.encode(style.fecha, forKey: .fecha)
        }
    }

}

// MARK: - Instructor
struct Instructor: Codable {
    let id: Int
    let nombre: String
    let fullPhoto: String
    let interests: Interests?
    let facePhoto: String
    let playlist: Playlist?
    
    enum CodingKeys: String, CodingKey {
        case id, nombre
        case fullPhoto = "full_photo"
        case interests
        case facePhoto = "face_photo"
        case playlist
    }
}

// MARK: - Interests
struct Interests: Codable {
    let philosophy, surprise, activities: String
    let instructor: Int
    let inspiration, fitness, music: String
}

// MARK: - Playlist
struct Playlist: Codable {
    let id: Int
    let name, referenceID: String
    let active: Bool

    enum CodingKeys: String, CodingKey {
        case id, name
        case referenceID = "reference_id"
        case active
    }
}

// MARK: - Calendar
struct Calendar: Codable {
    let classesCalendar : InstructorCalendar
}

// MARK: - InstructorCalendar
struct InstructorCalendar: Codable {
    let instructor: Instructor
    let fecha: String
    let id, intensity, duration, classType: Int
    let anniversary: Bool
    let textoEspecial, hour, tipo: String

    enum CodingKeys: String, CodingKey {
        case instructor, fecha, id, intensity, duration
        case classType = "class_type"
        case anniversary, textoEspecial, hour, tipo
    }
}
