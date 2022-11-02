//
//  CommentView.swift
//  Comments
//
//  Created by Cole Warner on 11/2/22.
//

import SwiftUI

struct CommentView: View {
    var comment: CommentModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("Name: \(comment.name ?? "")")
                .font(.headline)
            Text("Comment: \(comment.body ?? "")")
            HStack {
                Text("PostID \(String(comment.postId ?? 0))")
                Spacer()
                Text("ID: \(String(comment.id ?? 0))")
                Spacer()
            }

            Text("Email: \(comment.email ?? "")")
        }
        Divider()
    }
}

