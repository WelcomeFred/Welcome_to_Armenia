//
//  Audio_TableViewCell.swift
//  welcome_tour
//
//  Created by User on 20.02.21.
//

import UIKit

class Audio_TableViewCell: UITableViewCell {

    @IBOutlet weak var titleSong: UILabel!
    
    @IBOutlet weak var artistSong: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
