//
//  ViewController.swift
//  Dil
//
//  Created by Maxime on 16/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var addPlayersButtonOutlet: UIButton!
    
    //MARK:- OutLet 🔗
    @IBOutlet weak var playersStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    var coreDataManager: CoreDataManager?
    var dataSegue : [Players]?
    
    //MARK:- Propreties 📦
    
    //MARK:- View Cycle ♻️
    
    override func viewWillLayoutSubviews() {
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tableView.reloadData()
    }
    
override func viewWillAppear(_ animated: Bool) {
    tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
        addPlayersButtonOutlet.layer.zPosition = 1
        
        //— 💡 Supprimer la barre du haut
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //X
        
        playersStackView.layer.masksToBounds = true
        playersStackView.layer.cornerRadius = CGFloat(10)
//
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
              coreDataManager = CoreDataManager(coreDataStack: appDelegate.coreDataStack)
        
        tableView.reloadData()
        
    }
    //MARK:- override 🧗
    
    //— 💡 Supprimer info bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         if let recipesVC = segue.destination as? GameViewController {
             recipesVC.dataSeguePlayer = dataSegue
         }
     }
 
    
    //MARK:- Button Action 🔴
    
    @IBAction func addPlayers(_ sender: Any) {
        self.performSegue(withIdentifier: "homeToAddPlayer", sender: (Any).self)
        tableView.reloadData()
    }
    

    
    //MARK:- Conditions☝🏻
    
    //MARK:- Interface Gestion 📱
    
    //MARK:- Others Func 🍱
    
    //MARK:- KeyBoard Gestion ⌨️
    
    //MARK:- Animate ⚡️
    
    func animateStackView() {
        
        
     
    }
    @IBAction func unwindToWelcome(segue:UIStoryboardSegue) { }

//MARK:- Extension ↔️


}

extension ViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coreDataManager?.players.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        dataSegue = coreDataManager?.players
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PlayersTableViewCell else { return UITableViewCell() }
        
        
        let playersData = coreDataManager?.players[indexPath.row]
        
        cell.configure(data: playersData ?? Players())
        
        
        let translationMovement = CATransform3DTranslate(CATransform3DIdentity, 0, 20, 0)
        cell.layer.transform = translationMovement
            cell.alpha = 0
            
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 20, initialSpringVelocity: 2, options: .curveEaseIn) {
            
                cell.layer.transform = CATransform3DIdentity
                cell.alpha = 1
                
            }
            
            cell.selectionStyle = .none
        
        
        return cell
    }
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        coreDataManager?.deletePlayer(indexPath : indexPath)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
}
    
}
