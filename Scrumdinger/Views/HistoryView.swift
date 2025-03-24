//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 24.03.2025.
//

import SwiftUI

struct HistoryView: View {
    
    let history: History
    
    var body: some View {
       
        ScrollView {
            
            VStack(alignment: .leading) {
                
                Divider()
                    .padding(.bottom)
                
                Text("Attendees")
                    .font(.headline)
                
                Text(history.attendeeString)
                
                if let transcript = history.transcript {
                    
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

#Preview {
    NavigationStack {
        HistoryView(history: History.history)
    }
}
