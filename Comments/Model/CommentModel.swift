//
//  CommentModel.swift
//  Comments
//
//  Created by Cole Warner on 11/2/22.
//

import Foundation

struct CommentModel: Identifiable, Codable {
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
}


