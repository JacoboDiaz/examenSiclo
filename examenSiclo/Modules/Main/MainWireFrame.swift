//
//  MainWireFrame.swift
//  examenSiclo
//
//  Created by YEiK on 19/05/22.
//  
//

import Foundation
import UIKit

class MainWireFrame: MainWireFrameProtocol {
    
    class func createMainModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "navigationMain")
        if let view = navController.children.first as? MainView {
            let presenter: MainPresenterProtocol & MainInteractorOutputProtocol = MainPresenter()
            let interactor: MainInteractorInputProtocol & MainRemoteDataManagerOutputProtocol = MainInteractor()
            let localDataManager: MainLocalDataManagerInputProtocol = MainLocalDataManager()
            let remoteDataManager: MainRemoteDataManagerInputProtocol = MainRemoteDataManager()
            let wireFrame: MainWireFrameProtocol = MainWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentLoginView(from view: MainViewProtocol) {
        let loginView = LoginWireFrame.createLoginModule()
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(loginView, animated: true)
        }
    }
    
    func presentSignUpView(from view: MainViewProtocol) {
        let loginView = SignUpWireFrame.createSignUpModule()
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(loginView, animated: true)
        }
    }
    
}
