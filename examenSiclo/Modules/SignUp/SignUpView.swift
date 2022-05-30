//
//  SignUpView.swift
//  examenSiclo
//
//  Created by YEiK on 20/05/22.
//  
//

import Foundation
import UIKit
import SkyFloatingLabelTextField

class SignUpView: UIViewController {
    
    // MARK: Properties
    @IBOutlet weak var firstNameTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var lastNameTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var emailLbl: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var birthdayTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var ladaLbl: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var phone: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var genderLbl: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var countryLbl: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var heightLbl: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var weight: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordLbl: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var repeatPasswordLbl: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var contentViewTF: UIView!
    @IBOutlet weak var contentViewTFHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var textFields: [UITextField]!
    var presenter: SignUpPresenterProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        configStyleTextFiels()
        configKeyBoard()
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        validate()
    }
    
    func validate(){
        do{
            let firstName = try firstNameTF.validatedText(validationType: .requiredField(field: ""))
            let lastName = try lastNameTF.validatedText(validationType: .requiredField(field: ""))
            let email = try emailLbl.validatedText(validationType: .email)
            let birthday = try birthdayTF.validatedText(validationType: .requiredField(field: ""))
            let country = try countryLbl.validatedText(validationType: .requiredField(field: ""))
            let phone = try phone.validatedText(validationType: .requiredField(field: ""))
            let gender = try genderLbl.validatedText(validationType: .requiredField(field: ""))
            let height = try heightLbl.validatedText(validationType: .requiredField(field: ""))
            let weight = try weight.validatedText(validationType: .requiredField(field: ""))
            let password = try passwordLbl.validatedText(validationType: .password)
            let repeatPassword = try repeatPasswordLbl.validatedText(validationType: .password)
            
            guard password == repeatPasswordLbl.text else{
                repeatPasswordLbl.errorMessage = "Se requiere al menos 8 caracteres"
                return
            }
            
        }catch let error{
            let errorMessageDefault = "Campo requerido"
            
            if let err = error as? ValidationError{
                
                if err.message == "Invalid e-mail Address"{
                    emailLbl.errorMessage = "Email no valido"
                    return
                }
                
                if err.message.contains("one numeric character") {
                    passwordLbl.errorMessage = "Agrega al menos un carácter numérico"
                    return
                }else if err.message.contains("have at least 8"){
                    passwordLbl.errorMessage = "Se requiere al menos 8 caracteres"
                    return
                }
            }
            
            if firstNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                firstNameTF.errorMessage = errorMessageDefault
            }else if lastNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                lastNameTF.errorMessage = errorMessageDefault
            }else if emailLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                emailLbl.errorMessage = errorMessageDefault
            }else if birthdayTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                birthdayTF.errorMessage = errorMessageDefault
            }else if countryLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                countryLbl.errorMessage = errorMessageDefault
            }else if phone.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                phone.errorMessage = errorMessageDefault
            }else if genderLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                genderLbl.errorMessage = errorMessageDefault
            }else if heightLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                heightLbl.errorMessage = errorMessageDefault
            }else if weight.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                weight.errorMessage = errorMessageDefault
            }else if passwordLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                passwordLbl.errorMessage = errorMessageDefault
            }else if repeatPasswordLbl.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                repeatPasswordLbl.errorMessage = errorMessageDefault
            }

            
        }
    }
    
    
    func viewSettings(){
        firstNameTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        lastNameTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailLbl.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        birthdayTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        countryLbl.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        phone.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        genderLbl.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        heightLbl.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        weight.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
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

extension SignUpView: UITextFieldDelegate{
    
    @objc func textFieldDidChange(_ textfield: UITextField) {
        
        
        if let floatingLabelTextField = textfield as? SkyFloatingLabelTextField {
            floatingLabelTextField.errorMessage = ""
        }
    }
    
    func configStyleTextFiels(){
        ladaLbl.iconImage = UIImage(imageLiteralResourceName: "icons/flags/mx_icon")
    }
}
