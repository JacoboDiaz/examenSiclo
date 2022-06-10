//
//  SignUpWireFrame.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation
import UIKit

class SignUpWireFrame: SignUpWireFrameProtocol {
    
    class func createSignUpModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SignUpView")
        if let view = viewController as? SignUpView {
            let presenter: SignUpPresenterProtocol & SignUpInteractorOutputProtocol = SignUpPresenter()
            let interactor: SignUpInteractorInputProtocol & SignUpRemoteDataManagerOutputProtocol = SignUpInteractor()
            let localDataManager: SignUpLocalDataManagerInputProtocol = SignUpLocalDataManager()
            let remoteDataManager: SignUpRemoteDataManagerInputProtocol = SignUpRemoteDataManager()
            let wireFrame: SignUpWireFrameProtocol = SignUpWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "SignUp", bundle: Bundle.main)
    }
    
    func presentViewHomeDetail(view: SignUpViewProtocol) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        guard let rootViewController = window.rootViewController else {
            return
        }
        
        let mainNC = HomeDetailWireFrame.createHomeDetailModule()
        mainNC.view.frame = rootViewController.view.frame
        mainNC.view.layoutIfNeeded()
        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            window.rootViewController = mainNC
        })
    }
    
    func presentSignUp(view: SignUpViewProtocol) {
        print("vamos a view select item")
    }
    
    
}
