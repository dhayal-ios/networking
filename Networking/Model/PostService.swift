//
//  PostService.swift
//  Networking
//
//  Created by dhayalprema on 25/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import Foundation

protocol PostDelegate {
    func displayPost(title: String,body: String)
}

class PostService {
    private let postUrl = "https://jsonplaceholder.typicode.com/posts/"
    
    var delegate: PostDelegate?
    
    func fetchPost(postId: Int = 1) {
        let urlString = "\(postUrl)\(postId)"
        performRequest(urlRequest: urlString)
    }
    
    private func performRequest(urlRequest: String) {
        if let url = URL(string: urlRequest) {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let post = self.parseRequest(postData: safeData) {
                        self.delegate?.displayPost(title: post.title, body: post.body)
                    }
                }
            }
            task.resume()
        }
    }
    
    private func parseRequest(postData: Data) -> Post? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(Post.self, from: postData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
