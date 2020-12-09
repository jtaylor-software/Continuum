//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Jeremy Taylor on 12/8/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    
    @IBOutlet weak var captionTextField: UITextField!
    var selectedImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.tabBarController?.selectedIndex = 0
    }
    
    
    @IBAction func addPostButtonTapped(_ sender: UIButton) {
        guard let selectedImage = selectedImage,
              let caption = captionTextField.text,
              !caption.isEmpty else { return }
        
        PostController.shared.createPostWith(photo: selectedImage, caption: caption) { (result) in
            
        }
        
        self.tabBarController?.selectedIndex = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotoSelectVC" {
            guard let destinationVC = segue.destination as? PhotoSelectorViewController else { return }
            
            destinationVC.delegate = self
        }
    }
    
    
} // End of Class

// MARK: - Extensions

extension AddPostTableViewController: PhotoSelectorViewControllerDelegate {
    func photoSelectorViewControllerSelected(image: UIImage) {
        selectedImage = image
    }
}
