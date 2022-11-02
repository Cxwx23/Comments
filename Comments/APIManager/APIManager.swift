//
//  APIManager.swift
//  Comments
//
//  Created by Cole Warner on 11/2/22.
//

import Foundation


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


