//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 24.03.2025.
//

import SwiftUI

struct MeetingTimerView: View {
    
    let speakers: [ScrumTimer.Speaker]
    let isRecording: Bool
    let theme: Theme
    
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone"
    }
    
    var body: some View {
        
        Circle()
            .strokeBorder(lineWidth: borderWidth)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                        .font(.title)
                    
                    Text("is speaking")
                    
                    Image(systemName: isRecording ? "mic" : "mic.slash")
                        .font(.title)
                        .padding(.top)
                        .accessibilityLabel(isRecording ? "with transcription" : "without transcription")
                    
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
            .overlay {
                ForEach(speakers) { speaker in
                     if speaker.isCompleted,
                        let index = speakers.firstIndex(where: { $0.id == speaker.id }) {
                         SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                             .rotation(Angle(degrees: -90))
                             .stroke(theme.mainColor, lineWidth: strokeWidth)
                     }
                }
            }
            .padding(.horizontal)
    }
    
    private let borderWidth: CGFloat = 24
    private let strokeWidth: CGFloat = 12
}

struct SpeakersForPreview {
    static var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false)]
    }
}

#Preview {
    MeetingTimerView(speakers: SpeakersForPreview.speakers, isRecording: true, theme: .yellow1)
}
