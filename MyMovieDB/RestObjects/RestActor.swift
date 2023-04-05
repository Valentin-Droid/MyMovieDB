//
//  RestActor.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 20/03/2023.
//

import Foundation

struct RestCredits: Codable {
    let cast: [RestActor]
}

struct RestActor: Codable {
    let name: String
    let character: String
    let profile_path: String?
}
