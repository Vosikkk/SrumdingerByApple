//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 20.03.2025.
//

import SwiftUI

struct ScrumsView: View {
    
    let scrums: [DailyScrum]
    
    var body: some View {
        
        NavigationStack {
            
            List(scrums) { scrum in
                
                NavigationLink {
                    DetailView(scrum: scrum)
                } label: {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

#Preview {
    ScrumsView(scrums: DailyScrum.sampleData)
}
