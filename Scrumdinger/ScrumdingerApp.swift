//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 20.03.2025.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @State private var store: ScrumStore = .init()
    
    var body: some Scene {
        
        WindowGroup {
            
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
