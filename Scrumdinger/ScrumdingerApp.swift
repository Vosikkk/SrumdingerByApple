//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 20.03.2025.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    
    @State private var errorWrapper: ErrorWrapper?
    
    @State private var store: ScrumStore = .init()
    
    var body: some Scene {
        
        WindowGroup {
            
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        errorWrapper = ErrorWrapper(
                            error: error,
                            guidance: "Try again later"
                        )
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    errorWrapper = ErrorWrapper(
                        error: error,
                        guidance: "Scrumdinger will load sample data and continue."
                    )
                }
            }
            .sheet(item: $errorWrapper) {
                store.scrums = DailyScrum.sampleData
            } content: { wrapper in
                ErrorView(errorWrapper: wrapper)
            }
        }
    }
}
