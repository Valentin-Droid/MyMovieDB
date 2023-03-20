//
//  DetailView.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 03/03/2023.
//

import SwiftUI

struct DetailView: View {
    
    let serie: Serie
    
    
    var body: some View {
        ScrollView {
            let movieDetailViewModel = MovieDetailHeaderViewModel(
                imageURL: serie.imageURL,
                title: serie.title,
                seasonCount: serie.seasons.count,
                rating: serie.rating
            )
            MovieDetailHeaderView(viewModel: movieDetailViewModel)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(serie.casting) { actor in
                        let actorCellViewModel = ActorCellViewModel(
                            imageURL: actor.url,
                            name: actor.name,
                            characterName: actor.characterName
                        )
                        ActorCell(viewModel: actorCellViewModel)
                            .frame(width: 100)
                    }
                }
            }
            ForEach(serie.seasons) { season in
                let seasonViewModel = SeasonCellviewModel(
                    imageURL: season.imageURL,
                    seasonNumber: season.seasonNumber,
                    episodesNumber: season.episodesCount,
                    description: season.description
                )
                SeasonCell(viewModel: seasonViewModel)
            }
        }
        .background(Color(red: 22/255, green: 32/255, blue: 53/255))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(serie: mockedSerie)
    }
}
