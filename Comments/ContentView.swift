//
//  ContentView.swift
//  Comments
//
//  Created by Cole Warner on 11/2/22.
//

import SwiftUI

struct CommentModel: Identifiable, Codable {
    var postId: Int?
    var id: Int?
    var name: String?
    var email: String?
    var body: String?
}


class CommentsViewModel: ObservableObject {
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
    
    func getData(urlString: String, closure: @escaping ([CommentModel]) -> ()) {
        
        guard let url = URL(string: urlString) else {
            print("Problem with URL")
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let jsonData = data, error == nil else {
                print("No JSON data returned")
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode([CommentModel].self, from: jsonData)
                print(decodedData)
                closure(decodedData)
                
            } catch {
                print("Problem decoding JSON")
            }
            
            
        }
        .resume()
    }
}



struct ContentView: View {
    
    @StateObject var vm = CommentsViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.comments) { comment in
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
                .listStyle(.plain)
                .navigationBarTitle(Text("Comments"))
                .navigationBarTitleDisplayMode(.inline)

                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
