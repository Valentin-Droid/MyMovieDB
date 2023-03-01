//
//  MockedData.swift
//  MyMovieDB
//
//  Created by Valentin Drelon on 22/02/2023.
//

import Foundation

let mockedCasting = [
    Actor(
        url:  URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7Jahy5LZX2Fo8fGJltMreAI49hC.jpg"),
        name: "Bryan Cranston",
        characterName: "Walter White"
    ),
    Actor(
        url:  URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/n2idYyiEbEgFBe6mAVrVoOw5CcY.jpg"),
        name: "Aaron Paul",
        characterName: "Jesse Pinkman"
    ),
    Actor(
        url:  URL(string: "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/adppyeu1a4REN3khtgmXusrapFi.jpg"),
        name: "Anna Gunn",
        characterName: "Skyler White"
    ),
]

let mockedSeasons = [
    Season(
        imageURL: URL(string: "https://www.themoviedb.org/t/p/w260_and_h390_bestv2/8heiYdc8oWbPODli86Vv3DvF3ON.jpg"),
        seasonNumber: 1,
        episodesCount: 7,
        description: "Walter White, 50 ans, est professeur de chimie dans un lycée du Nouveau-Mexique. Son quotidien est bouleversé lorsqu’il apprend qu’il est atteint d’un cancer des poumons incurable. Il n’a plus qu’une seule solution pour mettre rapidement sa famille à l’abri du besoin : fabriquer et vendre une drogue de synthèse. Commence alors une longue descente aux enfers."
    ),
    Season(
        imageURL: URL(string: "https://www.themoviedb.org/t/p/w260_and_h390_bestv2/7TCinBKR0Q8ZewY11WHMW0mvFoZ.jpg"),
        seasonNumber: 2,
        episodesCount: 13,
        description: "Après les mésaventures rencontrées avec Krazy-8 et Tuco Salamanca, Walter et Jesse décident de monter leur propre affaire. Mais alors que l’empire d'Heisenberg s’étend de plus en plus, un deal tourne mal et les ennuis commencent. Sur les conseils de Saul Goodman, son avocat véreux, Walter entre en contact avec le propriétaire d’une chaîne de restaurant qui pourrait l’aider à écouler ses stocks de drogue. Pendant ce temps, Skyler commence à avoir des doutes sur son mari tandis que Jesse sombre peu à peu dans l’héroïne."
    )
]

let mockedSerie = Serie(
    imageURL: URL(string: "https://www.themoviedb.org/t/p/w1280/ggFHVNu6YYI5L9pCfOacjizRGt.jpg"),
    title: "Breaking Bad",
    description: "Walter White, professeur de chimie dans un lycée d'Albuquerque au Nouveau-Mexique, est atteint d'un cancer pulmonaire en phase terminale. Il s'associe à Jesse Pinkman, un ancien élève, cancre, toxicomane et dealer, afin d'assurer l'avenir financier de sa famille après son décès. L'improbable duo va alors synthétiser et commercialiser la plus pure méthamphétamine en cristaux jamais vue dans les Amériques.",
    seasons: mockedSeasons,
    casting: mockedCasting,
    rating: 8.9
)
