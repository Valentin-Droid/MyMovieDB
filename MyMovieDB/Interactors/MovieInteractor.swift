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
                    self.movieRepository.getMovieDetails(id: id, casting: casting) { serie in
                        fetchedSeries.append(serie)
                        completion(fetchedSeries)
                    }
                }
            }
        }
    }
}
