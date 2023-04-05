//
//  SeasonMapper.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 20/03/2023.
//

import Foundation

class SeasonMapper {
    
    static func map(jsonSeason: [String: Any]) -> Season {
        let posterPath = jsonSeason["poster_path"] as? String
        return Season(
            imageURL: URL(string: "https://www.themoviedb.org/t/p/w1280\(posterPath ?? "")"),
            seasonNumber: jsonSeason["season_number"] as! Int,
            episodesCount: jsonSeason["episode_count"] as! Int,
            description: jsonSeason["overview"] as! String
        )
    }
}
