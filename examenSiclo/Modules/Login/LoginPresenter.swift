//
//  LoginPresenter.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation

class LoginPresenter  {
    
    // MARK: Properties
    weak var view: LoginViewProtocol?
    var interactor: LoginInteractorInputProtocol?
    var wireFrame: LoginWireFrameProtocol?
    
}

extension LoginPresenter: LoginPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func LoggingIn(userLogin: UserLoginEntity){
        view?.showLoadingView()
        interactor?.interactorGetData(userLogin: userLogin)
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func loginInteractorCallBackValidLogin(isValid: Bool) {
        view?.hidenLoadingView()
        if isValid {
            print("Ir a otra ventana")
            wireFrame?.presentViewHomeDetail(view: view!)
        }else{
            print("Mostrar alerta en vistta de login")
            view?.presenterPushData()
        }
    }
    
}
