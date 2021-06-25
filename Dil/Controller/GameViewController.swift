//
//  GameViewController.swift
//  Dil
//
//  Created by Maxime on 25/06/2021.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK:- OutLet 🔗
    
    @IBOutlet weak var turnLabel: UILabel!
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
    
    var dataSeguePlayer : [Players]?
    let turn = 0
    
    //MARK:- View Cycle ♻️
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerManager()
        
        
    }
    
    //MARK:- Button Action 🔴
    @IBAction func didTapLittleChallenge(_ sender: Any) {
        
    }
    
    @IBAction func didTapBigChallenge(_ sender: Any) {
        
    }
    
    //MARK:- override 🧗
    
    //MARK:- Conditions☝🏻
    func playerManager(){
        pseudoLabel.text = dataSeguePlayer?[turn].pseudo ?? "noData"
        scoreLabel.text = String(dataSeguePlayer?[turn].score ?? 0)
        capacityLabel.text = dataSeguePlayer?[turn].capacity ?? ""
        pictureImageView.image = UIImage(data: dataSeguePlayer?[turn].picture ?? Data())
    }
    
    func gameManager(){
        
        turnLabel.text = String(turn)
        
        if turn == 1 {
            
        }
        
        
    }
    
    //MARK:- Interface Gestion 📱
    
    //MARK:- Others Func 🍱
    
    //MARK:- KeyBoard Gestion ⌨️
    
    //MARK:- Animate ⚡️
    
    //MARK:- Extension ↔️
    
    
    
    
}
