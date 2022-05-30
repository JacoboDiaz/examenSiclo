//
//  UITextField+Ext.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 27/05/22.
//

import UIKit

extension UITextField {
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = ValidatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
}
