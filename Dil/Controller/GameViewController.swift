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
    var coreDataManager : CoreDataManager?
    var dataSeguePlayer : [Players]?
    var turn = 0
    let challenge = ChallengesData()
    
    //MARK:- View Cycle ♻️
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerManager()
        gameManager()
        
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
              coreDataManager = CoreDataManager(coreDataStack: appDelegate.coreDataStack)
        
    }
    
    //MARK:- Button Action 🔴
    @IBAction func didTapLittleChallenge(_ sender: Any) {
        let valuePoint = challenge.littlesChallenges.randomElement()?.value ?? 0
        coreDataManager?.addPoint(value:valuePoint,index:turn)
        turn = +1
        gameManager()
        playerManager()
        
    }
    
    @IBAction func didTapBigChallenge(_ sender: Any) {
        let valuePoint = challenge.bigChallenges.randomElement()?.value ?? 0
        coreDataManager?.addPoint(value:valuePoint,index:turn)
        turn = +1
        gameManager()
        playerManager()
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
        
        turnLabel.text = String(turn + 1)
        
        littleChallengeButton.setTitle(challenge.littlesChallenges.randomElement()?.key, for: .normal)
        bigChallengeButton.setTitle(challenge.bigChallenges.randomElement()?.key, for: .normal)
    

    }
    
    //MARK:- Interface Gestion 📱
    
    //MARK:- Others Func 🍱
    
    //MARK:- KeyBoard Gestion ⌨️
    
    //MARK:- Animate ⚡️
    
    //MARK:- Extension ↔️
    
    
    
    
}
