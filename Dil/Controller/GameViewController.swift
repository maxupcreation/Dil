//
//  GameViewController.swift
//  Dil
//
//  Created by Maxime on 25/06/2021.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK:- OutLet 🔗
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var pseudoLabel: UILabel!
    @IBOutlet weak var capacityLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var capacityButton: UIButton!
    
    @IBOutlet weak var littleChallengeLabel: UILabel!
    @IBOutlet weak var bigChallengeLabel: UILabel!
    
    @IBOutlet weak var littleChallengeButton: UIButton!
    @IBOutlet weak var bigChallengeButton: UIButton!
    
    //MARK:- Propreties 📦
    
    var coreDataManager : CoreDataManager?

    //MARK:- View Cycle ♻️
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
              coreDataManager = CoreDataManager(coreDataStack: appDelegate.coreDataStack)
        
    }

    //MARK:- Button Action 🔴
    @IBAction func didTapLittleChallenge(_ sender: Any) {
        
    }
    
    @IBAction func didTapBigChallenge(_ sender: Any) {
        
    }
    
    //MARK:- override 🧗

    //MARK:- Conditions☝🏻
    
    func gameGestion(){
        
    }

    //MARK:- Interface Gestion 📱

    //MARK:- Others Func 🍱

    //MARK:- KeyBoard Gestion ⌨️

    //MARK:- Animate ⚡️

    //MARK:- Extension ↔️

 
    

}
