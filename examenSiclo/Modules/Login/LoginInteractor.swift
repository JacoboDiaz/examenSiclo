//
//  LoginInteractor.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation

class LoginInteractor: LoginInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: LoginInteractorOutputProtocol?
    var localDatamanager: LoginLocalDataManagerInputProtocol?
    var remoteDatamanager: LoginRemoteDataManagerInputProtocol?
    
    func interactorGetData(userLogin: UserLoginEntity) {
        remoteDatamanager?.externalGetData(userLogin: userLogin)
    }
}

extension LoginInteractor: LoginRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    func RemoteDataManagerCallBackValidLogin(isValid: Bool) {
        presenter?.loginInteractorCallBackValidLogin(isValid: isValid)
    }
}
