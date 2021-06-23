//
//  addPlayerViewController.swift
//  Dil
//
//  Created by Maxime on 22/06/2021.
//

import UIKit

final class AddPlayerViewController: UIViewController {
    
    
    @IBOutlet weak var addPictureButton: UIButton!
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var addPlayer: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
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
        
        addPictureButton.setBackgroundImage(image, for: .normal)
        
    }
}



