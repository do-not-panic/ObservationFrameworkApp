//
//  ObservationFrameworkAppApp.swift
//  ObservationFrameworkApp
//
//  Created by René Pfammatter on 07.11.2024.
//

import SwiftUI

@main
struct ObservationFrameworkAppApp: App {
    
    @State private var authModel = AuthModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(authModel)
        }
    }
}
