//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 20.03.2025.
//

import SwiftUI

struct ScrumsView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    
    @Binding var scrums: [DailyScrum]
    
    @State private var isPresentingNewScrumView: Bool = false
    
    let saveAction: () -> Void
    
    var body: some View {
        
        NavigationStack {
            
            List($scrums) { $scrum in
                
                NavigationLink {
                    DetailView(scrum: $scrum)
                } label: {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                
                Button(action: { isPresentingNewScrumView = true }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(
                scrums: $scrums,
                isPresentingNewScrumView: $isPresentingNewScrumView
            )
        }
        .onChange(of: scenePhase) { _, newValue in
            if newValue == .inactive { saveAction() } 
        }
    }
}

#Preview {
    ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: {})
}
