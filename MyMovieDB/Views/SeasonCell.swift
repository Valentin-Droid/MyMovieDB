//
//  SeasonView.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 15/02/2023.
//

import SwiftUI
import Kingfisher

struct SeasonCell: View {
    
    let viewModel: SeasonCellviewModel
    
    var body: some View {
        HStack(spacing: 16) {
            KFImage(viewModel.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 150)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 8) {
                VStack(alignment: .leading, spacing: 0) {
                    Text("Saison \(viewModel.seasonNumber)")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("\(viewModel.episodesNumber) épisodes")
                        .foregroundColor(.white.opacity(0.5))
                        .font(.caption)
                        .lineLimit(1)
                }
                Text(viewModel.description)
                    .font(.callout)
                    .fontWeight(.light)
                    .lineLimit(4)
            }
            Spacer()
        }
        .foregroundColor(.white)
        .padding(8)
    }
}

struct SeasonCell_Previews: PreviewProvider {
    
    static let viewModel = SeasonCellviewModel(
        imageURL: URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/xg6acFlE0RVMaNpcZuCq3cMYxx0.jpg"),
        seasonNumber: 3,
        episodesNumber: 0,
        description: "Scott Lang et Hope Van Dyne font équipe avec les parents de Hope et la fille de Scott pour explorer le monde quantique, interagir avec d'étranges nouvelles créatures et se lancer dans une aventure qui les poussera au-delà des limites de ce qu'ils croyaient possible."
    )
    
    static var previews: some View {
        SeasonCell(viewModel: viewModel)
            .background(Color(red: 22/255, green: 32/255, blue: 53/255))
            .previewLayout(.sizeThatFits)
    }
}
