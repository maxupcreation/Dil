//
//  ViewController.swift
//  Dil
//
//  Created by Maxime on 16/06/2021.
//

import UIKit
import AnimatedGradientView

class ViewController: UIViewController {
    
    //MARK:- OutLet 🔗
    @IBOutlet weak var playersStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Propreties 📦
    
    //MARK:- View Cycle ♻️
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomColor()
        
        //— 💡 Supprimer la barre du haut
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        //X
        
        playersStackView.layer.masksToBounds = true
        playersStackView.layer.cornerRadius = CGFloat(10)
        
        setupCustomCell()
        
    }
    //MARK:- override 🧗
    
    //— 💡 Supprimer info bar
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    //MARK:- Button Action 🔴
    
    @IBAction func addPlayers(_ sender: Any) {
        
        let viewController = UIViewController(nibName: "addPlayerViewController", bundle: nil)
        self.navigationController?.pushViewController(viewController,animated:true)
    }
    
    
    //— 💡 Allows you to assign the custom cell (XIB) to the desired tableView.
    
    private func setupCustomCell() {
        let nib = UINib(nibName: "playerCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableViewCell")
    }
    
    //MARK:- Conditions☝🏻
    
    //MARK:- Interface Gestion 📱
    
    //MARK:- Others Func 🍱
    
    //MARK:- KeyBoard Gestion ⌨️
    
    //MARK:- Animate ⚡️
    
    func getRandomColor() {
        let animatedGradient = AnimatedGradientView(frame: view.bounds)
        animatedGradient.direction = .downLeft
        animatedGradient.animationValues = [(colors: ["#9b5de5", "#f15bb5"], .up, .radial),
        (colors: ["#fee440", "#00bbf9", "#00f5d4"], .right, .axial),
        (colors: ["#9b5de5", "#f15bb5"], .down, .radial),
        (colors: ["#fee440", "#00bbf9", "#00f5d4"], .left, .axial)]
        view.insertSubview(animatedGradient, at:0)
        }
    }


//MARK:- Extension ↔️



