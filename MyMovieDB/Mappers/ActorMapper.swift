//
//  ActorMapper.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 20/03/2023.
//

import Foundation

class ActorMapper {
    
    static func map(jsonActor: [String: Any]) -> Actor {
        let profilePath = jsonActor["profile_path"] as? String
        let name = jsonActor["name"] as! String
        let character = jsonActor["character"] as! String
        
        return Actor(
            url: URL(string: "https://www.themoviedb.org/t/p/w1280\(profilePath ?? "")"),
            name: name,
            characterName: character
        )
    }
}
