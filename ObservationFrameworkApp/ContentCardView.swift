//
//  ContentCardView.swift
//  ObservationFrameworkApp
//
//  Created by René Pfammatter on 07.11.2024.
//

import SwiftUI

struct ContentCardView: View {
    
    enum ActionType {
        case like
        case dislike
        case reviews
    }
    
    let item: Content
    let action: (ActionType) -> Void
    
    var body: some View {
        
        return HStack {
            Text(item.type.emoji)
                .font(.largeTitle)
                .padding()
                .background(colors.randomElement()!.gradient, in: .rect(cornerRadius: 15))
                .frame(maxHeight: .infinity, alignment: .top)
                .padding(.top)
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.system(.title,
                                  design: .rounded,
                                  weight: .semibold))
                
                Text(item.author)
                    .font(.system(.caption,
                                  design: .rounded,
                                  weight: .bold))
                
                Text(item.description)
                    .lineLimit(2, reservesSpace: true)
                    .font(.system(.body,
                                  design: .rounded,
                                  weight: .light))
                
                HStack (spacing: 16){
                    
                    HStack {
                        
                        Button(action: {
                            action(.like)
                        }, label: {
                            Image(systemName: "hand.thumbsup")
                                .symbolVariant(.fill)
                                })
                        .buttonStyle(.borderless)
                        
                        Text("\(item.rating.likes)")
                            .font(.system(.footnote,
                                          design: .rounded,
                                          weight: .bold))
                        
                    }
                    
                    HStack {
                        
                        Button(action: {
                            action(.dislike)
                        }, label: {
                            Image(systemName: "hand.thumbsdown")
                                .symbolVariant(.fill)
                                })
                        .buttonStyle(.borderless)
                        
                        Text("\(item.rating.dislikes)")
                            .font(.system(.footnote,
                                          design: .rounded,
                                          weight: .bold))
                        
                    }
                }
                
                Button("\(item.reviews.count) Reviews",
                       systemImage: "text.bubble.fill") {
                    action(.reviews)
                }
                .foregroundStyle(.black)
                .font(.system(.caption,
                             design: .rounded,
                             weight: .bold))
                .buttonStyle(.bordered)
                .padding(.top, 8)
            }
        }
        .listRowSeparator(.hidden)
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ContentCardView(item: .sample.first!) { _ in }
        .frame(height: 150)
        .padding()
}
