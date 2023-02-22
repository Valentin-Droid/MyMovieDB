//
//  MovieDetailHeaderView.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 15/02/2023.
//

import SwiftUI
import Kingfisher

struct MovieDetailHeaderView: View {
    
    let viewModel: MovieDetailHeaderViewModel
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                KFImage(viewModel.imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(viewModel.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("\(viewModel.seasonCount) saisons" + " | " +
                             viewModel.genres.joined(separator: " • "))
                        .foregroundColor(.white.opacity(0.6))
                        .font(.footnote)
                    }
                    Spacer()
                    CircleProgressBar(progress: viewModel.rating)
                        .frame(width: 45, height: 45)
                        .padding(2.5)
                }
                .padding()
                .padding(.top, 80)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [.clear, Color(red: 22/255, green: 32/255, blue: 53/255)]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }
    }
}

struct MovieDetailHeaderView_Previews: PreviewProvider {
    
    static let viewModel = MovieDetailHeaderViewModel(
        imageURL: URL(string: "https://www.themoviedb.org/t/p/w1280/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg"),
        title: "Ant-Man and the Wasp: Quantumania",
        seasonCount: 3,
        genres: ["Adventure", "Science Fiction", "Comedy"],
        rating: 7.8
    )
    
    static var previews: some View {
        MovieDetailHeaderView(viewModel: viewModel)
            .background(Color(red: 22/255, green: 32/255, blue: 53/255))
            .previewLayout(.sizeThatFits)
    }
}
