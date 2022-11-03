//
//  ContentView.swift
//  Comments
//
//  Created by Cole Warner on 11/2/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = CommentViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.comments) { comment in
                    CommentView(comment: comment)
                        .padding(.bottom)
                }
                .navigationBarTitle(Label.title.rawValue)
                .navigationBarTitleDisplayMode(.inline)
                
                Spacer()
            }
            .listStyle(.plain)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
