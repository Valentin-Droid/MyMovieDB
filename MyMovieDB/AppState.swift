//
//  AppState.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 03/03/2023.
//

import Foundation

class AppState: ObservableObject {
    
   @Published var series: [Serie] = []
    
    static var preview: AppState {
        let appState = AppState()
        appState.series = [
            mockedSerie,
            mockedSerie,
            mockedSerie,
            mockedSerie,
            mockedSerie
        ]
        return appState
    }
}
