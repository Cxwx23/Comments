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
            Text(Label.name.rawValue + (comment.name ?? ""))
                .font(.headline)
            Text(Label.body.rawValue + (comment.body ?? ""))
            Text(Label.email.rawValue + (comment.email ?? ""))
            HStack {
                Text(Label.id.rawValue + String(comment.id ?? 0))
                Spacer()
                Text(Label.postId.rawValue + String(comment.postId ?? 0))
                Spacer()
            }

            
        }
    }
}

