//
//  MainProtocols.swift
//  examenSiclo
//
//  Created by YEiK on 19/05/22.
//  
//

import Foundation
import UIKit

protocol MainViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MainPresenterProtocol? { get set }
}

protocol MainWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createMainModule() -> UIViewController
    
    func presentLoginView(from view : MainViewProtocol)
    func presentSignUpView(from view : MainViewProtocol)
}

protocol MainPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: MainViewProtocol? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var wireFrame: MainWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func showLoginView()
    func showSignUpView()
    
}

protocol MainInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol MainInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: MainInteractorOutputProtocol? { get set }
    var localDatamanager: MainLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MainRemoteDataManagerInputProtocol? { get set }
}

protocol MainDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol MainRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MainRemoteDataManagerOutputProtocol? { get set }
}

protocol MainRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MainLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
