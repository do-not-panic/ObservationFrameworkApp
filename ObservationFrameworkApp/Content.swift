//
//  Content.swift
//  ObservationFrameworkApp
//
//  Created by René Pfammatter on 07.11.2024.
//

import Foundation
import SwiftUI



        
let colors: [Color] = [
    .red,
    .green,
    .blue,
    .yellow,
    .pink,
    .purple,
    .mint,
    .brown,
    .cyan,
    .indigo,
    .teal
]

struct Content: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let author: String
    var type: PublishingType
    var isFavourite: Bool
    var rating: Rating
    var reviews: [Review]
    
    static let sample: [Content] = [
        .init(title: "Adventure in the Jungle",
              description: "A thrilling tale of survival in the deep jungle",
              author: "John Doe",
              type: .manga,
              isFavourite: false,
              rating: .init(likes: 25, dislikes: 3),
              reviews: [
                .init(title: "A gripping Tale", comment: "A true masterpiece! I can't recommend this enough. It's a must-read for everyone"),
                .init(title: "Impressive Work", comment: "A true masterpiece! I can't recommend this enough. It's a must-read for everyone"),
                .init(title: "Not What I Expected", comment: "I thought this would be just another book, but it surprised me in the best way possible. It's a unique gem in the literary world."),
                .init(title: "Impressive Work", comment: "I couldn't put this book down. It kept me engaged from start to finish. THis book is a real page-turner!"),
                .init(title: "A Gripping Tale", comment: "I was captivated from the very first page. The characters are well-developed and the plot is full of unexpected twists and turns."),
              ]),
        .init(title: "Mystery Magazine",
              description: "A collection of intriguing mysteries",
              author: "Jane Smith",
              type: .magazine,
              isFavourite: false,
              rating: .init(likes: 15, dislikes: 1),
              reviews: [
                .init(title: "Not What I Expected", comment: "I thought this would be just another book, but it surprised me in the best way possible. It's a unique gem in the literary world."),
                .init(title: "Impressive Work", comment: "I couldn't put this book down. It kept me engaged from start to finish. THis book is a real page-turner!"),
              ]),
        .init(title: "Daily News",
              description: "The latest news from around the world",
              author: "News Team",
              type: .newspaper,
              isFavourite: false,
              rating: .init(likes: 50, dislikes: 5),
              reviews: [
                .init(title: "Impressive Work", comment: "I can't recommend this enough. It's a must-read for everyone"),
                .init(title: "Not What I Expected", comment: "I thought this would be just another newspaper, but it surprised me in the best way possible. It's a unique gem in the news world."),
              ]),
        .init(title: "The Great Gatsby",
              description: "A novel by F. Scott Fitzgerald",
              author: "F. Scott Fitzgerald",
              type: .book,
              isFavourite: true,
              rating: .init(likes: 0, dislikes: 0),
              reviews: []),
        .init(title: "The Alchemist",
              description: "A novel by Paulo Coelho",
              author: "Paulo Coelho",
              type: .magazine,
              isFavourite: true,
              rating: .init(likes: 0, dislikes: 0),
              reviews: []),
        .init(title: "The Da Vinci Code",
              description: "A novel by Dan Brown",
              author: "Dan Brown",
              type: .book,
              isFavourite: false,
              rating: .init(likes: 0, dislikes: 0),
              reviews: []),
        ]
}

extension Content {
    enum PublishingType {
        case magazine
        case manga
        case book
        case newspaper
       
    }
}

extension Content {
    struct Rating {
        var likes: Int = 0
        var dislikes: Int = 0
    }
}

extension Content.Rating {
    
    mutating func like() {
        likes += 1
    }
    
    mutating func dislike() {
        dislikes += 1
    }
}


extension Content {
    struct Review: Identifiable {
        let id = UUID()
        var title: String
        var comment: String
    }
}

extension Content.PublishingType {
    var emoji: String {
        switch self {
        case .magazine: return "📖"
        case .manga: return "📚"
        case .book: return "📕"
        case .newspaper: return "📰"
        }
    }
        
    
}
