//
//  ActorCell.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 15/02/2023.
//

import SwiftUI
import Kingfisher

struct ActorCell: View {
    
    let viewModel: ActorCellViewModel
    
    var body: some View {
        VStack{
            KFImage(viewModel.imageURL)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            Text(viewModel.name)
                .font(.footnote)
                .fontWeight(.semibold)
            Text(viewModel.characterName)
                .font(.caption2)
                .foregroundColor(Color.white.opacity(0.5))
        }
        .fixedSize(horizontal: false, vertical: true)
        .padding(4)
        .foregroundColor(.white)
    }
}

struct ActorCell_Previews: PreviewProvider {
    
    static let viewModel = ActorCellViewModel(
        imageURL: URL(
            string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/8eTtJ7XVXY0BnEeUaSiTAraTIXd.jpg"),
        name: "Paul Rudd",
        characterName: "Scott Lang / Ant-Man"
    )
    
    static var previews: some View {
        ActorCell(viewModel: viewModel)
        .frame(width: 120)
        .previewLayout(.sizeThatFits)
        .background(Color(red: 22/255, green: 32/255, blue: 53/255))

    }
}
