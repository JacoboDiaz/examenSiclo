//
//  UITextField+Ext.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 27/05/22.
//

import UIKit

extension UITextField : UITextFieldDelegate {
    
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text,
               let textRange = Range(range, in: text) {
               let updatedText = text.replacingCharacters(in: textRange, with: string)
               print(updatedText)
            print(updatedText)
            }
            return true
    }
//
//    @objc func textFieldDidChange(){
//        print("textFieldDidChange")
////        delegateInput?.enterTextEvent(text: input.text ?? "", kind: self.inputType)
////        self.text = self.text!.grouping(every: 2, with: "/")
////        if self.inputType == .expirationDate{
////            input.text = input.text!.grouping(every: 2, with: "/")
////        }else if self.inputType == .cardNumber{
////            input.text = input.text!.grouping(every: 4, with: " ")
////        }
//    }
}
