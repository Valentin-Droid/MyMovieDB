//
//  MyMovieDBApp.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 15/02/2023.
//

import SwiftUI

@main
struct MyMovieDBApp: App {
    
    private let appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(appState)
        }
    }
}
