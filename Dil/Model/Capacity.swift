//
//  Capacity.swift
//  Dil
//
//  Created by Maxime on 25/06/2021.
//

import UIKit

struct Capacity {
   
    var capacityArray = ["Pistolet de duel","Clés de passe-partout","Transmuteur","Arc de cupidon","Bombe atomique","talisman de protection", "Godiveau"]
    
    func randomCapacityReturn() -> String {
        let randomCapacity = Int.random(in: 0...100)
        if randomCapacity > 80 {
            let index = Int.random(in: 0..<capacityArray.count)
            return capacityArray[index]
        }
        return "aucun objet"
    }
}
