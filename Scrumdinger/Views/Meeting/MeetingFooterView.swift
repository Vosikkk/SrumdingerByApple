//
//  MeetingFooterView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 23.03.2025.
//

import SwiftUI

struct MeetingFooterView: View {
    
    let speakers: [ScrumTimer.Speaker]
    
    var skipAction: () -> Void
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                if isLastSpeaker {
                    
                    Text("Last speaker")
                    
                } else {
                    
                    Text(speakerText)
                    
                    Spacer()
                    
                    Button(action: skipAction) {
                        Image(systemName: "forward.fill")
                    }
                    .accessibilityLabel("Next speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
    
    
    // MARK: - Computed Properties
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted })
        else { return nil }
        
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    
    private var speakerText: String {
        guard let speakerNumber else { return "No more speakers" }
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
}

#Preview {
    MeetingFooterView(
        speakers: DailyScrum.sampleData[0].attendees.speakers,
        skipAction: {}
    )
}
