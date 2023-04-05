//
//  MovieInteractor.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 23/02/2023.
//

import Foundation

class MovieInteractor {
    
    let movieRepository = RealMovieRepository()
    
    func getSeries(completion: @escaping ([Serie]) -> Void) {
        
        var fetchedSeries = [Serie]()
        
        movieRepository.getPopularSerieIDs { serieIDs in
            for id in serieIDs {
                self.movieRepository.getCreditsDetails(forMovieID: id) { casting in
                    self.movieRepository.getCreditsDetails(forMovieID: id) { restActors in
                        self.movieRepository.getMovieDetails(id: id) { restSerie in
                            var seasons = [Season]()
                            for restSeason in restSerie.seasons {
                                let newSeason =  Season(
                                    imageURL: URL(string: "https://image.tmdb.org/t/p/w500\(restSeason.poster_path ?? "")"),
                                    seasonNumber: restSeason.season_number,
                                    episodesCount: restSeason.episode_count,
                                    description: restSeason.overview
                                )
                                seasons.append(newSeason)
                            }
                            var actors = [Actor]()
                            for restActor in restActors {
                                let newActor = Actor(
                                    url: URL(string: "https://image.tmdb.org/t/p/w500\(restActor.profile_path ?? "")"),
                                    name: restActor.name,
                                    characterName: restActor.character
                                )
                                actors.append(newActor)
                            }
                            
                            let newSerie = Serie(
                                imageURL: URL(string: "https://image.tmdb.org/t/p/w500\(restSerie.poster_path ?? "")"),
                                title: restSerie.name,
                                description: restSerie.overview,
                                seasons: seasons,
                                casting: actors,
                                rating: restSerie.vote_average
                            )
                            fetchedSeries.append(newSerie)
                            completion(fetchedSeries)
                        }
                    }
                }
            }
        }
    }
}
