//
//  ReviewsView.swift
//  ObservationFrameworkApp
//
//  Created by René Pfammatter on 07.11.2024.
//

import SwiftUI

struct ReviewsView: View {
    
    @State private var reviewToModify: Content.Review?
    @State private var showModifyReview: Bool = false
    @Environment(\.dismiss) var dismiss
    
    @Bindable var contentModel: ContentModel
    private let itemIndex: Int
    
    init(contentModel: ContentModel, item: Content) {
        self.contentModel = contentModel
        self.itemIndex = contentModel.data.firstIndex(where: { $0.id == item.id} ) ?? 0
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contentModel.data[itemIndex].reviews) { item in
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.system(.title3,
                                          design: .rounded,
                                          weight: .bold))
                        Text(item.comment)
                        
                    }
                    .frame(maxWidth: .infinity)
                    .listRowSeparator(.hidden)
                    .padding()
                    .background(Color(uiColor: .systemGray5),
                                in: .rect(cornerRadius: 10))
                    .swipeActions {
                        Button("Edit",
                               systemImage: "pencil"){
                            reviewToModify = item
                        }
                               .tint(.blue)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Reviews")
            .toolbar(content: {
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Close") {
                        dismiss()
                    }
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("Add Review") {
                        showModifyReview.toggle()
                    }
                    
                    Spacer()
                }
            })
            .sheet(item: $reviewToModify) {
                reviewToModify = nil
            } content: { review in
                if let reviewsIndex = self.contentModel.data[itemIndex].reviews.firstIndex(where: {$0.id == review.id}) {
                    ModifyReviewView(contentModel: contentModel,
                                     contentIndexToEdit: itemIndex,
                                     reviewIndexToEdit: reviewsIndex)
                    .presentationDetents([.height(500)])
                    .presentationDragIndicator(.visible)
                    
                }
            }

//            .sheet(isPresented: $showModifyReview, content: {
//                ModifyReviewView()
//                    .presentationDetents([.height(500)])
//                    .presentationDragIndicator(.visible)
//            })
        }
    }
}
#Preview {
    ReviewsView(contentModel: .init(), item: .sample.first!)
}
