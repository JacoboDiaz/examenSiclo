//
//  HomeDetailInteractor.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 22/05/22.
//  
//

import Foundation
import SwiftyJSON

class HomeDetailInteractor: HomeDetailInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: HomeDetailInteractorOutputProtocol?
    var localDatamanager: HomeDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: HomeDetailRemoteDataManagerInputProtocol?
    
    func interactorGetData() {
        remoteDatamanager?.remoteGetData()
    }
}

extension HomeDetailInteractor: HomeDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func homeDetailRemoteDataManagerCallBackData(classScheduleJSON: JSON, status: Bool) {
        var calendarClassArry = [CalendarClass]()
        if let classSchedule = classScheduleJSON["calendar"].dictionary {
            for (key, jsonData) in classSchedule {
                
                var calendarClass = CalendarClass()
                calendarClass.key = key
                
                for (_, clase) in jsonData {
                    var classes = Classes()
                    classes.instructor.facePhoto = clase["instructor"]["face_photo"].stringValue
                    classes.instructor.id = clase["instructor"]["id"].intValue
                    classes.instructor.nombre = clase["instructor"]["nombre"].stringValue
                    classes.textoEspecial = clase["textoEspecial"].stringValue
                    classes.hour = clase["hour"].stringValue
                    classes.tipo = clase["tipo"].stringValue
                    classes.fecha = clase["fecha"].stringValue
                    print(clase["tipo"].stringValue)
                    calendarClass.classes.append(classes)
                }
                calendarClassArry.append(calendarClass)
            }
            
        }
        
        presenter?.interactorCallBackData(classSchedule: calendarClassArry, status: status)
    }
}
