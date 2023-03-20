//
//  Season.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 16/02/2023.
//

import Foundation

struct Season: Identifiable {
    let id = UUID()
    let imageURL: URL?
    let seasonNumber: Int
    let episodesCount: Int
    let description: String
}
