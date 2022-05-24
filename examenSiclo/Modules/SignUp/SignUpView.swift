//
//  SignUpView.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation
import UIKit

class SignUpView: UIViewController {

    // MARK: Properties
    var presenter: SignUpPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SignUpView: SignUpViewProtocol {
    // TODO: implement view output methods
}
