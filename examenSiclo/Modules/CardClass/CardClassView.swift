//
//  CardClassView.swift
//  examenSiclo
//
//  Created by Jacobo Emmanuel Diaz Rodriguez on 23/05/22.
//

import UIKit

class CardClassView: UITableViewCell {

    @IBOutlet weak var hourLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var exerciseLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCard(classes: Classes){
        self.hourLbl.text = "· \(classes.hour)"
        self.nameLbl.text = classes.instructor.nombre
        self.exerciseLbl.text = classes.tipo
    }

}
