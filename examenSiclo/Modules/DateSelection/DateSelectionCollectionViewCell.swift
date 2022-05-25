//
//  DateSelectionCollectionViewCell.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 24/05/22.
//

import UIKit

class DateSelectionCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var contenView: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var contenViewW: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected{
                contenView.backgroundColor = .darkGray
                dateLbl.textColor = .white
            }else{
                contenView.backgroundColor = .clear
                dateLbl.textColor = .darkGray
            }
        }
    }

}
