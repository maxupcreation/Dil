//
//  addPlayerViewController.swift
//  Dil
//
//  Created by Maxime on 22/06/2021.
//

import UIKit

final class AddPlayerViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var addPictureButton: UIButton!
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var addPlayer: UIButton!
    
    var coreDataManager : CoreDataManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        coreDataManager = CoreDataManager(coreDataStack: appDelegate.coreDataStack)
        
        addButtonManagerRefresh()
        
        addPictureButton.setTitle("Prendre une photo", for: .normal)
        addPictureButton.titleLabel?.textAlignment = .center
        addPlayer.layer.masksToBounds = true
        addPlayer.layer.cornerRadius = CGFloat(10)
        
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @IBAction func didTapAddPlayerButton(_ sender: Any) {
        
        let image = addPictureButton.imageView?.image ?? UIImage()
        let pseudo = pseudoTextField.text ?? ""
     
        if pseudo != "" {
        coreDataManager?.savePlayer(pseudo: pseudo, image: image)
        }
        
    }
    
    func addButtonManagerRefresh(){
        
        if pseudoTextField.text == "" {
            addPlayer.isEnabled = false
            addPlayer.alpha = 0.5
        } else {
            addPlayer.isEnabled = true
            addPlayer.alpha = 1
        }
    }
    
    //MARK:- KeyBoard Gestion ⌨️
    
     
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         pseudoTextField.resignFirstResponder()
         addButtonManagerRefresh()
         return true
     }
     
    
}



extension AddPlayerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
func imagePickerControllerDidCancel(_ picker:UIImagePickerController){
    picker.dismiss(animated: true, completion: nil)
}
    
   func imagePickerController(_ picker:UIImagePickerController,
                              didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        
       addPictureButton.setImage(image, for: .normal)
       addPictureButton.imageView?.contentMode = UIView.ContentMode.scaleAspectFill
       addPictureButton.layer.masksToBounds = true
       addPictureButton.layer.cornerRadius = 10
       addPictureButton.titleLabel?.text = ""

    }
}



