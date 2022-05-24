//
//  HomeDetailProtocols.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 22/05/22.
//  
//

import Foundation
import UIKit
import SwiftyJSON

protocol HomeDetailViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: HomeDetailPresenterProtocol? { get set }
    
    func presenterCallBackData(classSchedule: [CalendarClass], status: Bool)
    
    func showLoadingView()
    func hidenLoadingView()
}

protocol HomeDetailWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createHomeDetailModule() -> UIViewController
}

protocol HomeDetailPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: HomeDetailViewProtocol? { get set }
    var interactor: HomeDetailInteractorInputProtocol? { get set }
    var wireFrame: HomeDetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol HomeDetailInteractorOutputProtocol: AnyObject {
    // INTERACTOR -> PRESENTER
    func interactorCallBackData(classSchedule: [CalendarClass], status: Bool)
}

protocol HomeDetailInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: HomeDetailInteractorOutputProtocol? { get set }
    var localDatamanager: HomeDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: HomeDetailRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetData()
}

protocol HomeDetailDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol HomeDetailRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: HomeDetailRemoteDataManagerOutputProtocol? { get set }
    
    func remoteGetData()
}

protocol HomeDetailRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func homeDetailRemoteDataManagerCallBackData(classScheduleJSON : JSON, status : Bool)
    
}

protocol HomeDetailLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
