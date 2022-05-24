//
//  MainPresenter.swift
//  examenSiclo
//
//  Created by YEiK on 19/05/22.
//  
//

import Foundation

class MainPresenter  {
    
    // MARK: Properties
    weak var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    var wireFrame: MainWireFrameProtocol?
}

extension MainPresenter: MainPresenterProtocol {
    
    // TODO: implement presenter methods
    func viewDidLoad() {}
    
    func showLoginView() {
        wireFrame?.presentLoginView(from: view!)
    }
    
    func showSignUpView() {
        wireFrame?.presentSignUpView(from: view!)
    }
    
}

extension MainPresenter: MainInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
