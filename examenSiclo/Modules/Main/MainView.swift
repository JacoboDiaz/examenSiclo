//
//  MainView.swift
//  examenSiclo
//
//  Created by YEiK on 19/05/22.
//  
//

import Foundation
import UIKit

class MainView: UIViewController {

    // MARK: Properties
    var presenter: MainPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func goToLoginView(_ sender: Any) {
        presenter?.showLoginView()
    }
    
    @IBAction func goToSignUpView(_ sender: Any) {
        presenter?.showSignUpView()
    }
    
}

extension MainView: MainViewProtocol {
    // TODO: implement view output methods
}
