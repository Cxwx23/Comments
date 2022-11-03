//
//  Common.swift
//  Comments
//
//  Created by Cole Warner on 11/2/22.
//

import Foundation

enum Server: String {
    case Comment = "https://jsonplaceholder.typicode.com/comments"
}

enum Label: String {
    case postId = "Post ID: "
    case id = "ID: "
    case name = "Name: "
    case email = "Email: "
    case body = "Comment: "
    case title = "Comments"
}
