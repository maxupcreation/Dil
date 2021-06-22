//
//  addPlayerViewController.swift
//  Dil
//
//  Created by Maxime on 22/06/2021.
//

import UIKit

final class AddPlayerViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var addPictureButton: UIButton!
    @IBOutlet weak var pseudoTextField: UITextField!
    @IBOutlet weak var addPlayer: UIButton!
    
   var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPictureButton.setBackgroundImage(imageView.image ?? UIImage(), for: .normal)
        
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        present(picker, animated: true)
    }
    
}



extension AddPlayerViewController {
    func imagePickerControllerDidCancel(_ picker:UIImagePickerController){
        picker.dismiss(animated: true, completion: nil)
        func imagePickerController(_picker:UIImagePickerController,
                                   didFinishpickingMediawithInfo info: [UIImagePickerController.InfoKey: Any]) {
            picker.dismiss(animated: true, completion: nil)
            
            guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
            }
            self.imageView.image = image
        }
    }
}
