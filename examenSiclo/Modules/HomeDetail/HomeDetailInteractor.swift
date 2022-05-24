//
//  HomeDetailInteractor.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 22/05/22.
//  
//

import Foundation

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
    
    func homeDetailRemoteDataManagerCallBackData(classSchedule: [ClassSchedule], status: Bool) {
        presenter?.interactorCallBackData(classSchedule: classSchedule, status : status)
    }
    
}
