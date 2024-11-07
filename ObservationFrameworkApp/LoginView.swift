//
//  LoginView.swift
//  ObservationFrameworkApp
//
//  Created by René Pfammatter on 07.11.2024.
//

import SwiftUI

struct LoginView: View {
    @Environment(AuthModel.self) private var authModel: AuthModel
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        
        @Bindable var authModel = authModel
        
        NavigationStack {
            VStack {
                
                TextField("Username", text: $authModel.user.username)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(uiColor: .systemGray5),
                                lineWidth: 2))
                
                SecureField("Password", text: $authModel.user.password)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(uiColor: .systemGray5),
                                lineWidth: 2))
                
                Button("Submit") {
                    authModel.login()
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .font(.system(.title3,
                             design: .rounded,
                             weight: .bold))
                
            }
            .padding()
            .navigationTitle("Login")
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
    LoginView()
        .environment(AuthModel())
}
