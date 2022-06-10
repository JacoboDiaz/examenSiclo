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
    
    var presenter: SignUpPresenterProtocol?
    
    // MARK: Properties
    @IBOutlet weak var firstNameTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var lastNameTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var emailTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var birthdayTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var phoneTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var genderTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var countryTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var heightTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var weightTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var passwordTF: SkyFloatingLabelTextFieldWithIcon!
    @IBOutlet weak var repeatPasswordTF: SkyFloatingLabelTextFieldWithIcon!
    
    @IBOutlet weak var contentViewTF: UIView!
    @IBOutlet weak var contentViewTFHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var selectCoutryView: UIView!
    @IBOutlet weak var selectGenderView: UIView!
    var textFields: [UITextField]!
    let userSignUpEntity = UserSignUpEntity()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewSettings()
        configKeyBoard()
    }
    
    @IBAction func goToRegister(_ sender: Any) {
        if validate() {
            presenter?.userSignUp(userSignUp: userSignUpEntity)
        }
    }
    
    func validate() -> Bool{
        do{
            let firstName = try firstNameTF.validatedText(validationType: .requiredField(field: ""))
            let lastName = try lastNameTF.validatedText(validationType: .requiredField(field: ""))
            let email = try emailTF.validatedText(validationType: .email)
            let birthday = try birthdayTF.validatedText(validationType: .requiredField(field: ""))
            let country = try countryTF.validatedText(validationType: .requiredField(field: ""))
            let phone = try phoneTF.validatedText(validationType: .requiredField(field: ""))
            let gender = try genderTF.validatedText(validationType: .requiredField(field: ""))
            let height = try heightTF.validatedText(validationType: .requiredField(field: ""))
            let weight = try weightTF.validatedText(validationType: .requiredField(field: ""))
            let password = try passwordTF.validatedText(validationType: .password)
            let repeatPassword = try repeatPasswordTF.validatedText(validationType: .password)
            
            userSignUpEntity.firstName = firstName
            userSignUpEntity.lastName = lastName
            userSignUpEntity.email = email
            userSignUpEntity.birthday = birthday
            userSignUpEntity.country = country
            userSignUpEntity.phone = phone
            userSignUpEntity.gender = gender
            userSignUpEntity.height = height
            userSignUpEntity.weight = weight
            userSignUpEntity.password = password
            userSignUpEntity.repeat_password = repeatPassword
            
            return true
            
        }catch let error{
            
            let errorMessageDefault = "Campo requerido"
            
            if let err = error as? ValidationError, !(emailTF.text?.isEmpty ?? false){
                if err.message == "Invalid e-mail Address"{
                    emailTF.errorMessage = "Email no valido"
                    emailTF.becomeFirstResponder()
                    return false
                }
                if err.message.contains("one numeric character") {
                    passwordTF.errorMessage = "Agrega al menos un carácter numérico"
                    return false
                }else if err.message.contains("have at least 8"){
                    passwordTF.errorMessage = "Se requiere al menos 8 caracteres"
                    return false
                }
            }
            
            if firstNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                firstNameTF.errorMessage = errorMessageDefault
                firstNameTF.becomeFirstResponder()
            }else if lastNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                lastNameTF.errorMessage = errorMessageDefault
                lastNameTF.becomeFirstResponder()
            }else if emailTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                emailTF.errorMessage = errorMessageDefault
                emailTF.becomeFirstResponder()
            }else if birthdayTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                birthdayTF.errorMessage = errorMessageDefault
                birthdayTF.becomeFirstResponder()
            }else if countryTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                countryTF.errorMessage = errorMessageDefault
                countryTF.becomeFirstResponder()
            }else if phoneTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                phoneTF.errorMessage = errorMessageDefault
                phoneTF.becomeFirstResponder()
            }else if genderTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                genderTF.errorMessage = errorMessageDefault
                genderTF.becomeFirstResponder()
            }else if heightTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                heightTF.errorMessage = errorMessageDefault
                heightTF.becomeFirstResponder()
            }else if weightTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                weightTF.errorMessage = errorMessageDefault
                weightTF.becomeFirstResponder()
            }else if passwordTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                passwordTF.errorMessage = errorMessageDefault
                passwordTF.becomeFirstResponder()
            }else if repeatPasswordTF.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty{
                repeatPasswordTF.errorMessage = errorMessageDefault
                repeatPasswordTF.becomeFirstResponder()
            }

            return false
        }
    }
    
    
    func viewSettings(){
        firstNameTF.delegate = self
        firstNameTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        lastNameTF.delegate = self
        lastNameTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        emailTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        birthdayTF.delegate = self
        birthdayTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        countryTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        phoneTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        genderTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        heightTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        weightTF.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        selectCoutryView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.actionSelectCoutry(sender:))))
        selectGenderView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:  #selector(self.actionSelectGender(sender:))))
    }
    
    @objc func actionSelectCoutry(sender : UITapGestureRecognizer) {
        presenter?.showSelectItem()
        print("actionSelectCoutry")
    }
    
    @objc func actionSelectGender(sender : UITapGestureRecognizer) {
        print("actionSelectGender")
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
        
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height - 20, right: 0.0)
        contentViewTFHeight.constant = contentViewTF.frame.height
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInsets: UIEdgeInsets = .zero
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    func showLoadingView() {
        LoadingView.shared.showActivityIndicator(uiView: self.view)
    }
    
    func hidenLoadingView() {
        LoadingView.shared.hideActivityIndicator(uiView: self.view)
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
        
//        if textfield.restorationIdentifier == "birthdayTF" {
//            textfield.text = textfield.text!.grouping(every: 2, with: "-")
//            
//        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        guard let text = textField.text, let textRange = Range(range, in: text) else {
            return false
        }
        
        if textField.restorationIdentifier == "firstNameTF" || textField.restorationIdentifier == "lastNameTF"{
            let updatedText = text.replacingCharacters(in: textRange, with: string)

            do {
                let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
                 return regex.firstMatch(in: updatedText, options: [], range: NSMakeRange(0, updatedText.count)) == nil
            } catch {
                return false
            }
        }else if textField.restorationIdentifier == "birthdayTF" {
            guard allowedCharacters.isSuperset(of: characterSet) else{
                print("No ingreso un número")
                return false
            }
        }
        
        return true
    }
    
}
