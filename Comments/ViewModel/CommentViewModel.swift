//
//  CommentViewModel.swift
//  Comments
//
//  Created by Cole Warner on 11/2/22.
//

import Foundation


class CommentViewModel: ObservableObject {
    @Published var comments: [CommentModel] = []
    
    init() {
        getComments()
    }
    
    func getComments() {
        getData(urlString: "https://jsonplaceholder.typicode.com/comments") { commentData in
            DispatchQueue.main.async {
                self.comments = commentData
            }
        }
    }
    
    
}
