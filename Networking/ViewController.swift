//
//  ViewController.swift
//  Networking
//
//  Created by dhayalprema on 24/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var postId: UITextField!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postBody: UITextView!
    let postService = PostService()
    
    @IBAction func viewPost(_ sender: Any) {
        
        if let id = postId.text {
            postService.fetchPost(postId: Int(id)!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postService.delegate = self
        postId.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: PostDelegate {
    func displayPost(title: String, body: String) {
        DispatchQueue.main.async {
            self.postTitle.text = title
            self.postBody.text = body
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) != nil {
           return true
        } else {
           return false
        }
    }
}
