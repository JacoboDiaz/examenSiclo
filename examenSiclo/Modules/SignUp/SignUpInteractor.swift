//
//  SignUpInteractor.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation

class SignUpInteractor: SignUpInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: SignUpInteractorOutputProtocol?
    var localDatamanager: SignUpLocalDataManagerInputProtocol?
    var remoteDatamanager: SignUpRemoteDataManagerInputProtocol?

}

extension SignUpInteractor: SignUpRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
