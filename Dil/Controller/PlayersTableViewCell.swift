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
        self.pictureImageVIew.image = self.pictureImageVIew.image?.rotate(radians: 1.56)
        self.pictureImageVIew.image = UIImage(data: data.picture ?? Data()) ?? UIImage()
        self.pictureImageVIew.layer.masksToBounds = true
        self.pictureImageVIew.layer.cornerRadius = CGFloat(10)
        self.pictureImageVIew.contentMode = .scaleAspectFill
        self.pseudoLabel.text = data.pseudo
        self.capacityLabel.text = data.capacity?.first
        self.ScoreLabel.text = String(data.score)
  
}
    
    
}
