//
//  HomeView.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 23/02/2023.
//

import SwiftUI

struct HomeView: View {
    
    let movieRepository = RealMovieRepository()
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(appState.series) { medium in
                    let viewModel = MovieCellViewModel(
                        imageURL: medium.imageURL,
                        title: medium.title,
                        seasonCount: medium.seasons.count,
                        rating: medium.rating,
                        description: medium.description
                    )
                    NavigationLink(destination: DetailView(serie: medium)) {
                        MovieCell(viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("My Movies")
            .background(Color(red: 22/255, green: 32/255, blue: 53/255))
            .preferredColorScheme(.dark)
        }
        .onAppear(perform: {
            loadSeries()
        })
    }
    
    func loadSeries() {
        MovieInteractor().getSeries { series in
            DispatchQueue.main.async {
                appState.series = series
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppState.preview)
    }
}

