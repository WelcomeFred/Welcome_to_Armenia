//
//  MyTableViewCell.swift
//  welcome_tour
//
//  Created by User on 23.02.21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var placeLbl: UILabel!
    @IBOutlet weak var regionLbl: UILabel!
    @IBOutlet weak var distanceLbl: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
