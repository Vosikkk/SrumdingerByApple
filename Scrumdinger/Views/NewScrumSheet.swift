//
//  NewScrumSheet.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 23.03.2025.
//

import SwiftUI

struct NewScrumSheet: View {
    
    @State private var newScrum: DailyScrum = .emptyScrum
    
    @Binding var scrums: [DailyScrum]
    @Binding var isPresentingNewScrumView: Bool
    
    var body: some View {
       
        NavigationStack {
            
            DetailEditView(scrum: $newScrum)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewScrumView = false
                            
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            isPresentingNewScrumView = false
                            scrums.append(newScrum)
                        }
                    }
                }
        }
    }
}

#Preview {
   
        NewScrumSheet(scrums: .constant(DailyScrum.sampleData), isPresentingNewScrumView: .constant(true))
}
