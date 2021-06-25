//
//  Post.swift
//  Networking
//
//  Created by dhayalprema on 25/06/21.
//  Copyright © 2021 dhayalprema. All rights reserved.
//

import Foundation

struct Post: Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String

}
