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
    func showLoadingView()
    func hidenLoadingView()
}

protocol SignUpWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createSignUpModule() -> UIViewController
    func presentViewHomeDetail(view: SignUpViewProtocol)
    func presentSignUp(view: SignUpViewProtocol)
}

protocol SignUpPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: SignUpViewProtocol? { get set }
    var interactor: SignUpInteractorInputProtocol? { get set }
    var wireFrame: SignUpWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func userSignUp(userSignUp : UserSignUpEntity)
    
    func showSelectItem()
    
}

protocol SignUpInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func interactorCallBackValidSignUp(isValid : Bool)
}

protocol SignUpInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: SignUpInteractorOutputProtocol? { get set }
    var localDatamanager: SignUpLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: SignUpRemoteDataManagerInputProtocol? { get set }
    
    func interactorUserSignUp(userSignUp: UserSignUpEntity)
}

protocol SignUpDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol SignUpRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SignUpRemoteDataManagerOutputProtocol? { get set }
    
    func externalGetDataUserSignUp(userSignUp: UserSignUpEntity)
}

protocol SignUpRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func remoteDataManagerCallBackValidSignUp(isValid: Bool)
}

protocol SignUpLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
