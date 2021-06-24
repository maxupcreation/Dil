//
//  PlayersTableViewCell.swift
//  Dil
//
//  Created by Maxime on 24/06/2021.
//

import UIKit

class PlayersTableViewCell: UITableViewCell {

    @IBOutlet weak var pictureImageVIew: UIImageView!
    @IBOutlet weak var pseudoLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

func configure(data:Players){
    pictureImageVIew.image = UIImage(data: data.picture ?? Data()) ?? UIImage()
    pseudoLabel.text = data.pseudo
    capacityLabel.text = data.capacity?.first
    ScoreLabel.text = String(data.score)
}
    
    
}
