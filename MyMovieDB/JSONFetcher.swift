//
//  JSONFetcher.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 20/03/2023.
//

import Foundation

class JSONFetcher {
    static func getJSON(from data: Data) -> [String: Any]? {
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json
        } catch {
            print("Erreur de conversion")
            return nil
        }
    }
    
    static func fetchJSON(from url: URL, completion: @escaping ([String: Any]) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            guard let json = self.getJSON(from: data) else { return }
            
            completion(json)
        }
        task.resume()
    }
}
