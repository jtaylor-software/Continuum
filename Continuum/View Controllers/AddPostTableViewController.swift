//
//  AddPostTableViewController.swift
//  Continuum
//
//  Created by Jeremy Taylor on 12/8/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class AddPostTableViewController: UITableViewController {
    
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var selectImageButton: UIButton!
    @IBOutlet weak var captionTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        selectImageButton.setTitle("Select Image", for: .normal)
        postImageView.image = nil
        captionTextField.text = nil
    }
    
    
    @IBAction func selectImageButtonTapped(_ sender: UIButton) {
        postImageView.image = UIImage(named: "spaceEmptyState")
        selectImageButton.setTitle("", for: .normal)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        self.tabBarController?.selectedIndex = 0
    }
    
    
    @IBAction func addPostButtonTapped(_ sender: UIButton) {
        guard let image = postImageView.image,
              let caption = captionTextField.text,
              !caption.isEmpty else { return }
        
        PostController.shared.createPostWith(photo: image, caption: caption) { (result) in
            
        }
        
        self.tabBarController?.selectedIndex = 0
    }
}
