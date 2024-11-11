//
//  ContentView.swift
//  ObservationFrameworkApp
//
//  Created by René Pfammatter on 07.11.2024.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(AuthModel.self) private var authModel: AuthModel
    
    @State private var contentModel = ContentModel()
    
    @State private var showReviews: Bool = false
    @State private var showLogin: Bool = false
    @State private var contentToReview: Content?
    
    
    var body: some View {
        NavigationStack {
            List {
                Section("(\(contentModel.favouritesCount)) Favourites") {
                    ForEach(contentModel.data.filter {
                        $0.isFavourite }) { item in
                            ContentCardView(item: item) { action in
                                switch action {
                                case .like:
                                    if authModel.isLoggedIn {
                                        contentModel.like(item)
                                    } else {
                                        showLogin.toggle()
                                    }
                                case .dislike:
                                    if authModel.isLoggedIn {
                                        contentModel.dislike(item)
                                    } else {
                                        showLogin.toggle()
                                    }
                                    
                                case .reviews:
                                    contentToReview = item
                                }
                                
                                
                            }
                            .swipeActions {
                                Button("Unfavourite", systemImage: "star.slash") {
                                    contentModel.toggleFavourite(item)
                                }
                                .tint(.yellow)
                            }
                        }
                }
                .headerProminence(.increased)
                
                Section {
                    ForEach(contentModel.data.filter { !$0.isFavourite} ) { item in
                        ContentCardView(item: item) { action in
                            switch action {
                            case .like:
                                if authModel.isLoggedIn {
                                    contentModel.like(item)
                                } else {
                                    showLogin.toggle()
                                }
                                
                            case .dislike:
                                if authModel.isLoggedIn {
                                    contentModel.dislike(item)
                                } else {
                                    showLogin.toggle()
                                }
                                
                            case .reviews:
                                contentToReview = item
                            }
                            
                            
                        }
                        .swipeActions {
                            Button("Favourite", systemImage: "star") {
                                contentModel.toggleFavourite(item)
                            }
                            .tint(.yellow)
                        }
                    }
                }
            }
            .navigationTitle("Content")
            .sheet(item: $contentToReview, onDismiss: {
                contentToReview = nil
            }, content: { item in
                ReviewsView(contentModel: contentModel, item: item)
            })
            .sheet(isPresented: $showLogin, content: {
                LoginView()
                    .presentationDetents([.height(400)])
                    .presentationDragIndicator(.visible)
            })
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Button(authModel.isLoggedIn ? "Logout" :"Login") {
                        if authModel.isLoggedIn {
                            authModel.logout()
                        } else  {
                            showLogin.toggle()
                        }
                        
                    }
                }
            })
        }
    }
}

#Preview {
    ContentView()
        .environment(AuthModel())
}
