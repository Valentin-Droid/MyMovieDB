//
//  MovieCell.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 15/02/2023.
//

import SwiftUI
import Kingfisher

struct MovieCell: View {
    
    let viewModel: MovieCellViewModel
    
    
    var body: some View {
        HStack {
            KFImage(viewModel.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 150)
                .clipped()
                .cornerRadius(8.0)
            VStack (alignment: .leading, spacing: 8) {
                HStack {
                    VStack (alignment: .leading) {
                        Text(viewModel.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text("\(viewModel.seasonCount) saisons")
                            .foregroundColor(Color.white.opacity(0.5))
                            .font(.caption)
                            .lineLimit(1)
                    }
                    Spacer()
                    CircleProgressBar(progress: viewModel.rating)
                        .frame(width: 45, height: 45)
                        .padding(2.5)
                }
                Text(viewModel.description)
                    .font(.callout)
                    .fontWeight(.light)
                    .lineLimit(4)
            }
        }
        .padding(8)
        .background(Color(red: 22/255, green: 32/255, blue: 53/255))
        .foregroundColor(.white)
    }
}

struct MovieCell_Previews: PreviewProvider {
    
    static let viewModel = MovieCellViewModel(
        imageURL: URL(string: "https://www.themoviedb.org/t/p/w1280/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg"),
        title: "Ant-Man and the Wasp: Quantumania",
        seasonCount: 3,
        rating: 7.8,
        description: "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible."
    )
    
    static var previews: some View {
        MovieCell(viewModel: viewModel)
            .previewLayout(.sizeThatFits)
    }
}
