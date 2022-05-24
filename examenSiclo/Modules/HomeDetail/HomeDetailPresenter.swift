//
//  HomeDetailPresenter.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 22/05/22.
//  
//

import Foundation

class HomeDetailPresenter  {
    
    // MARK: Properties
    weak var view: HomeDetailViewProtocol?
    var interactor: HomeDetailInteractorInputProtocol?
    var wireFrame: HomeDetailWireFrameProtocol?
    
}

extension HomeDetailPresenter: HomeDetailPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.showLoadingView()
        interactor?.interactorGetData()
    }
}

extension HomeDetailPresenter: HomeDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
    
    func interactorCallBackData(classSchedule: [CalendarClass], status: Bool) {
        view?.presenterCallBackData(classSchedule: classSchedule, status: status)
    }
    
}
