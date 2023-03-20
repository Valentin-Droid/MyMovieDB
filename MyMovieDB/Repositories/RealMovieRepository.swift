//
//  RealMovieRepository.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 23/02/2023.
//

import Foundation

class RealMovieRepository {
    
    func getPopularSerieIDs(completion: @escaping ([Int]) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/tv/popular?api_key=\(API_KEY)&language=en-US")!
        
        var IDs = [Int]()
        
        JSONFetcher.fetchJSON(from: url) { json in
            let results = json["results"] as! [[String: Any]]
            
            for result in results {
                let id = result["id"] as! Int
                IDs.append(id)
            }
            completion(IDs)
        }
    }
    
    func getMovieDetails(id: Int, casting: [Actor], completion: @escaping (Serie) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)?api_key=\(API_KEY)&language=en-US")!

        JSONFetcher.fetchJSON(from: url) { json in
            let posterPath = json["poster_path"] as? String
            let name = json["name"] as! String
            let overview = json["overview"] as! String
            let voteAverage = json["vote_average"] as! NSNumber
            
            // Recuperer les saisons
            let seasonJSON = json["seasons"] as! [[String: Any]]
            var seasons = [Season]()
            for season in seasonJSON {
                let newSeason = Season(
                    imageURL: URL(string: "https://www.themoviedb.org/t/p/w1280\(season["poster_path"] as? String ?? "")"),
                    seasonNumber: season["season_number"] as! Int,
                    episodesCount: season["episode_count"] as! Int,
                    description: season["overview"] as! String
                )
                seasons.append(newSeason)
            }
            let serie = Serie(
                imageURL: URL(string: "https://www.themoviedb.org/t/p/w1280\(posterPath ?? "")"),
                title: name,
                description: overview,
                seasons: seasons,
                casting: casting,
                rating: Float(truncating: voteAverage)
            )
            print(serie.imageURL ?? "pas d'image")
            completion(serie)
        }
    }
    
    func getCreditsDetails(forMovieID id: Int, completion: @escaping ([Actor]) -> Void) {
        let url = URL(string: "https://api.themoviedb.org/3/tv/\(id)?api_key=\(API_KEY)&language=en-US")!
        
        JSONFetcher.fetchJSON(from: url) { json in
            var actors = [Actor]()
            let cast = json["cast"] as? [[String: Any]]
            for actor in cast ?? [] {
                let profilePath = actor["profile_path"] as? String
                let name = actor["name"] as! String
                let character = actor["character"] as! String
                
                let newActor = Actor(
                    url: URL(string: "https://www.themoviedb.org/t/p/w1280\(profilePath ?? "")"),
                    name: name,
                    characterName: character
                )
                actors.append(newActor)
            }
            completion(actors)
        }
    }
}
