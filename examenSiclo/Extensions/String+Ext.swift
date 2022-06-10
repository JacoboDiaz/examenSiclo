//
//  String+Ext.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 08/06/22.
//

import Foundation
import UIKit

extension String {
    func grouping(every groupSize: String.IndexDistance, with separator: Character) -> String {
        let cleanedUpCopy = replacingOccurrences(of: String(separator), with: "")
        
        return String(cleanedUpCopy.enumerated().map() {
            $0.offset % groupSize == 0 ? [separator, $0.element] : [$0.element]
        }.joined().dropFirst())
    }
}
