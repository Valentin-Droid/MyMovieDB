//
//  Serie.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 16/02/2023.
//

import Foundation

struct Serie {
    let imageURL: URL?
    let title: String
    let description: String
    let seasons: [Season]
    let genres: [String]
    let casting: [Actor]
    let rating: Float
}
