//
//  GameViewController.swift
//  Dil
//
//  Created by Maxime on 25/06/2021.
//

import UIKit

class GameViewController: UIViewController {
    
    //MARK: - Injections
    
 
    
    
    //MARK: - OutLet 🔗
    
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
    var turnGame = 0
    var turnPlayer = 0
    let challenge = ChallengesData()
    
    //MARK: View Cycle ♻️
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playerLabelGraphics()
        gameManager()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        coreDataManager = CoreDataManager(coreDataStack: appDelegate.coreDataStack)
        
    }
    
    //MARK: Button Action 🔴
    
    @IBAction func didTapLittleChallenge(_ sender: Any) {
        let valuePoint = challenge.littlesChallenges.randomElement()?.value ?? 0
        
        
        coreDataManager?.addPoint(value:valuePoint,index:turnPlayer)
        
        turnPlayer += 1
        
        gameManager()
        playerLabelGraphics()
        
    }
    
    @IBAction func didTapBigChallenge(_ sender: Any) {
        let valuePoint = challenge.bigChallenges.randomElement()?.value ?? 0
        
        coreDataManager?.addPoint(value:valuePoint,index:turnPlayer)
        
        turnPlayer += 1
        
        gameManager()
        playerLabelGraphics()
    }
    
    //MARK: override 🧗
    
    
    
    //MARK: Managements ☝🏻
    
    
    func gameManager(){
        
        turnGameCondition()
        
        littleChallengeButton.setTitle(challenge.littlesChallenges.randomElement()?.key, for: .normal)
        bigChallengeButton.setTitle(challenge.bigChallenges.randomElement()?.key, for: .normal)
    }
    
   private func turnGameCondition(){
       let playerCount = dataSeguePlayer?.count ?? 0
       
        if turnPlayer == playerCount {
            turnGame += 1
            turnPlayer = 0
        }
        
        if turnGame == 10 {
            self.performSegue(withIdentifier: "gameToEndView", sender: (Any).self)
        }
        
    }
    
    //MARK: Interface Gestion 📱
    
    func playerLabelGraphics(){
        
        turnLabel.text = "Tour " + String(turnGame)
        
        pseudoLabel.text = dataSeguePlayer?[turnPlayer].pseudo ?? "noData"
        scoreLabel.text = String(dataSeguePlayer?[turnPlayer].score ?? 0)
        capacityLabel.text = dataSeguePlayer?[turnPlayer].capacity ?? ""
        pictureImageView.image = UIImage(data: dataSeguePlayer?[turnPlayer].picture ?? Data())
    }
    
    //MARK: Others Func 🍱
    
    //MARK: KeyBoard Gestion ⌨️
    
    //MARK: Animate ⚡️
    
    //MARK: Extension ↔️
    
    
    
    
}
