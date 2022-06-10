//
//  SignUpPresenter.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation

class SignUpPresenter  {
    
    // MARK: Properties
    weak var view: SignUpViewProtocol?
    var interactor: SignUpInteractorInputProtocol?
    var wireFrame: SignUpWireFrameProtocol?
    
}

extension SignUpPresenter: SignUpPresenterProtocol {
  
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func userSignUp(userSignUp: UserSignUpEntity) {
        view?.showLoadingView()
        interactor?.interactorUserSignUp(userSignUp: userSignUp)
    }
    
    func showSelectItem() {
        print("showSelectItem")
        wireFrame?.presentSignUp(view: view!)
    }
     
}

extension SignUpPresenter: SignUpInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interactorCallBackValidSignUp(isValid: Bool) {
        view?.hidenLoadingView()
        if isValid {
            print("Ir a otra ventana")
            wireFrame?.presentViewHomeDetail(view: view!)
        }else{
            print("Mostrar alerta en vistta de login")
            wireFrame?.presentViewHomeDetail(view: view!)
//            view?.presenterPushData()
        }
    }
    
}
