//
//  UIImageView+RoundedImage.swift
//  Dil
//
//  Created by Maxime on 24/06/2021.
//

import UIKit

extension UIImageView {
    
    func roundedImage(){
        
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
    
}
