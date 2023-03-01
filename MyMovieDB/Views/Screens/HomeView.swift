//
//  HomeView.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 23/02/2023.
//

import SwiftUI

struct HomeView: View {
    
    let movieRepository = RealMovieRepository()
    @State var medias = [Serie]()
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(medias) { medium in
                    let viewModel = MovieCellViewModel(
                        imageURL: medium.imageURL,
                        title: medium.title,
                        seasonCount: medium.seasons.count,
                        rating: medium.rating,
                        description: medium.description
                    )
                    MovieCell(viewModel: viewModel)
                }
            }
            .navigationTitle("My Movies")
            .background(Color(red: 22/255, green: 32/255, blue: 53/255))
            .preferredColorScheme(.dark)
        }
        .onAppear(perform: {
            MovieInteractor().getSeries { series in
                medias = series
            }
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
