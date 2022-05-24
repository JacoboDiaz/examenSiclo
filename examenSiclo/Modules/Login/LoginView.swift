//
//  LoginView.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation
import UIKit

class LoginView: UIViewController {

    // MARK: Properties
    var presenter: LoginPresenterProtocol?
    @IBOutlet weak var textFieldUser: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    var textFields: [UITextField]!
    var errorLabel = UILabel()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
    }
    
    
    @IBAction func actionLogin(_ sender: Any) {
        if validateForm() {
            print("Validacion ok")
            let userLogin = UserLoginEntity(email: textFieldUser.text!, password: textFieldPassword.text!)
            presenter?.LoggingIn(userLogin: userLogin)
        }
    }
    
    private func validateForm() -> Bool {
        guard let usernameTxt = textFieldUser.text, usernameTxt.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {
            return false
        }
        
        guard let password = textFieldPassword.text, password.trimmingCharacters(in: .whitespacesAndNewlines).count > 0 else {
            return false
        }
        return true
    }
    
    func viewSettings(){
        textFields = [textFieldUser, textFieldPassword]
        configKeyBoard()
    }
    
    
}

extension LoginView: LoginViewProtocol {
    // TODO: implement view output methods
    
    func presenterPushData() {
        print("Mostrando aviso de login inválido")
    }
    
    func showLoadingView() {
        LoadingView.shared.showActivityIndicator(uiView: self.view)
    }
    
    func hidenLoadingView() {
        LoadingView.shared.hideActivityIndicator(uiView: self.view)
    }
}

extension LoginView : UITextFieldDelegate {
    func configKeyBoard(){
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillchange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillchange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillchange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case textFieldUser:
            textFieldPassword.becomeFirstResponder()
        case textFieldPassword:
            textFieldPassword.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        return true
    }
    
    @objc func keyboardWillchange(notification: Notification){
        var moveScrollY : CGFloat = 0
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification ||
            notification.name == UIResponder.keyboardWillChangeFrameNotification {
            moveScrollY = self.setScrollViewPosition(keyboardRect: keyboardRect.height)
        }
        
        UIView.animate(withDuration: 0.75, animations: { () -> Void in
            self.view.frame.origin.y = moveScrollY
        })
        
    }
    
    func setScrollViewPosition(keyboardRect: CGFloat) -> CGFloat{
        var moveScroll: CGFloat = 0
        //Calculamos la altura de la pantalla
        let screenSize : CGRect = UIScreen.main.bounds
        let screenHeight : CGFloat = screenSize.height
        
        for textField in textFields {
            
            if textField.isFirstResponder {
                print(textField.placeholder!)
                
                // Calculamos la 'Y' máxima del UITextField
                let frame = self.view.getConvertedFrame(fromSubview: textField)
                //let frame = self.viewLogin.convert(textField.frame, to: self.view)
                let yPositionField = frame!.origin.y //textField.bounds.origin.y//textField.frame.origin.y
                let heightField = textField.frame.size.height
                let yPositionMaxField = yPositionField + heightField
                
                // Calculamos la 'Y' máxima del View que no queda oculta por el teclado
                let Ymax = screenHeight - keyboardRect
                
                // Comprobamos si nuestra 'Y' máxima del UITextField es superior a la Ymax
                if yPositionMaxField > Ymax{
                    moveScroll = -((yPositionMaxField - Ymax) + (heightField + 30))
                }
            }
        }
        
        return moveScroll
    }
}
