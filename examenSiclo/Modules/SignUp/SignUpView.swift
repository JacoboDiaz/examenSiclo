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
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailLbl: UITextField!
    @IBOutlet weak var birthdayTF: UITextField!
    @IBOutlet weak var ladaLbl: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var genderLbl: UITextField!
    @IBOutlet weak var countryLbl: UITextField!
    @IBOutlet weak var heightLbl: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var passwordLbl: UITextField!
    @IBOutlet weak var repeatPasswordLbl: UITextField!
    
    @IBOutlet weak var contentViewTF: UIView!
    @IBOutlet weak var contentViewTFHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var presenter: SignUpPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        configKeyBoard()
        showAlert()
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        showAlert()
    }
    
    
    func viewSettings(){
        self.firstNameTF.setStyleLogin()
        self.lastNameTF.setStyleLogin()
        self.emailLbl.setStyleLogin()
        self.birthdayTF.setStyleLogin()
        self.ladaLbl.setStyleLogin()
        self.phone.setStyleLogin()
        self.genderLbl.setStyleLogin()
        self.countryLbl.setStyleLogin()
        self.heightLbl.setStyleLogin()
        self.weight.setStyleLogin()
        self.passwordLbl.setStyleLogin()
        self.repeatPasswordLbl.setStyleLogin()
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "Próximamente", message: "Sin funcionalidad :(", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func configKeyBoard(){
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let info = notification.userInfo!
        let kbSize = (info[UIResponder.keyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
        
        print(kbSize)
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        contentViewTFHeight.constant = contentViewTF.frame.height
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets: UIEdgeInsets = .zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
}

extension SignUpView: SignUpViewProtocol {
    // TODO: implement view output methods
}
