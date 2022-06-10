//
//  UIViewController+Ext.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 08/06/22.
//

import UIKit

extension UIViewController {

    func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
       }
    
}
