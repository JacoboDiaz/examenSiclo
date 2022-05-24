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
}

extension SignUpPresenter: SignUpInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
