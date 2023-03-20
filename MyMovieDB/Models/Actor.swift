//
//  Actor.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 16/02/2023.
//

import Foundation

struct Actor: Identifiable {
    let id = UUID()
    let url: URL?
    let name: String
    let characterName: String
}
