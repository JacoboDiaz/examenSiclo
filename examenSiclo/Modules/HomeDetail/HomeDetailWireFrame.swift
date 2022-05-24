//
//  HomeDetailWireFrame.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 22/05/22.
//  
//

import Foundation
import UIKit

class HomeDetailWireFrame: HomeDetailWireFrameProtocol {
    
    class func createHomeDetailModule() -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeDetailView")
        if let view = viewController as? HomeDetailView {
            let presenter: HomeDetailPresenterProtocol & HomeDetailInteractorOutputProtocol = HomeDetailPresenter()
            let interactor: HomeDetailInteractorInputProtocol & HomeDetailRemoteDataManagerOutputProtocol = HomeDetailInteractor()
            let localDataManager: HomeDetailLocalDataManagerInputProtocol = HomeDetailLocalDataManager()
            let remoteDataManager: HomeDetailRemoteDataManagerInputProtocol = HomeDetailRemoteDataManager()
            let wireFrame: HomeDetailWireFrameProtocol = HomeDetailWireFrame()
            
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
        return UIStoryboard(name: "HomeDetail", bundle: Bundle.main)
    }
}
