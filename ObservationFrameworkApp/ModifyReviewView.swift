//
//  ModifyReviewView.swift
//  ObservationFrameworkApp
//
//  Created by René Pfammatter on 07.11.2024.
//

import SwiftUI

struct ModifyReviewView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Bindable var contentModel: ContentModel
    let contentIndexToEdit: Int
    let reviewIndexToEdit: Int
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: $contentModel.data[contentIndexToEdit].reviews[reviewIndexToEdit].title)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(uiColor: .systemGray5), lineWidth: 2))
                
                TextEditor(text: $contentModel.data[contentIndexToEdit].reviews[reviewIndexToEdit].comment)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(uiColor: .systemGray5), lineWidth: 2))
                
                Button("Add Review") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .font(.system(.title3,
                              design: .rounded,
                              weight: .bold))
            }
            .padding()
            .navigationTitle("Add Review")
            .toolbar(content: {
                ToolbarItem(placement: .primaryAction) {
                    Button("Close") {
                        dismiss()
                    }
                }
            })
        }
    }
}

#Preview {
    ModifyReviewView(contentModel: .init(), contentIndexToEdit: 0, reviewIndexToEdit: 0)
}
