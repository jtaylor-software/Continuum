//
//  PostController.swift
//  Continuum
//
//  Created by Jeremy Taylor on 12/8/20.
//  Copyright © 2020 trevorAdcock. All rights reserved.
//

import UIKit

class PostController {
    static let shared = PostController()
    var posts: [Post] = []
    
    func addComment(with text: String, post: Post, completion: (Result<Comment, PostError>)-> Void) {
        let comment = Comment(text: text, post: post)
        post.comments.append(comment)
    }
    
    func createPostWith(photo: UIImage?, caption: String, completion: (Result<Post?, PostError>)-> Void) {
        let post = Post(photoData: nil, caption: caption, photo: photo)
        posts.append(post)
    }
    
} // End of Class
