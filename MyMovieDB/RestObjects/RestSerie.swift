//
//  RestSerie.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 20/03/2023.
//

import Foundation

struct RestSerie: Codable {
    let name: String
    let poster_path: String?
    let overview: String
    let vote_average: Float
    let seasons: [RestSeason]
}

struct RestSeason: Codable {
    let poster_path: String?
    let episode_count: Int
    let overview: String
    let season_number: Int
}
