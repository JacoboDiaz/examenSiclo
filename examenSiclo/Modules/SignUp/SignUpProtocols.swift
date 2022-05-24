//
//  SignUpProtocols.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation
import UIKit

protocol SignUpViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: SignUpPresenterProtocol? { get set }
}

protocol SignUpWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createSignUpModule() -> UIViewController
}

protocol SignUpPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: SignUpViewProtocol? { get set }
    var interactor: SignUpInteractorInputProtocol? { get set }
    var wireFrame: SignUpWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol SignUpInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol SignUpInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SignUpInteractorOutputProtocol? { get set }
    var localDatamanager: SignUpLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SignUpRemoteDataManagerInputProtocol? { get set }
}

protocol SignUpDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol SignUpRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SignUpRemoteDataManagerOutputProtocol? { get set }
}

protocol SignUpRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol SignUpLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
