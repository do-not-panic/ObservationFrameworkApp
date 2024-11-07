//
//  ContentModel.swift
//  ObservationFrameworkApp
//
//  Created by René Pfammatter on 07.11.2024.
//

import Foundation
import Observation

@Observable
class ContentModel {
    var data: [Content] = Content.sample
    
    var favouritesCount: Int {
        data.filter(\.isFavourite).count
    }
    
    func like(_ content: Content) {
        if let index = data.firstIndex(where: {$0.id == content.id}) {
            data[index].rating.like()
        }
    }
    
    func dislike(_ content: Content) {
        if let index = data.firstIndex(where: {$0.id == content.id}) {
            data[index].rating.dislike()
        }
    }
    
    func toggleFavourite(_ content: Content) {
        if let index = data.firstIndex(where: {$0.id == content.id}) {
            data[index].isFavourite.toggle()
        }
    }
}
