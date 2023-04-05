//
//  SerieMapper.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 20/03/2023.
//

import Foundation

class SerieMapper {
    
    static func map(jsonSerie: [String: Any], casting: [Actor], seasons: [Season]) -> Serie {
        let posterPath = jsonSerie["poster_path"] as? String
        let name = jsonSerie["name"] as! String
        let overview = jsonSerie["overview"] as! String
        let voteAverage = jsonSerie["vote_average"] as! NSNumber
        
        return Serie(
            imageURL: URL(string: "https://www.themoviedb.org/t/p/w1280\(posterPath ?? "")"),
            title: name,
            description: overview,
            seasons: seasons,
            casting: casting,
            rating: Float(truncating: voteAverage)
        )
    }
    
}
