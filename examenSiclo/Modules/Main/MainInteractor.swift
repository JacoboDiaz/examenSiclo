//
//  MainInteractor.swift
//  examenSiclo
//
//  Created by YEiK on 19/05/22.
//  
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MainInteractorOutputProtocol?
    var localDatamanager: MainLocalDataManagerInputProtocol?
    var remoteDatamanager: MainRemoteDataManagerInputProtocol?

}

extension MainInteractor: MainRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
