//
//  MeetingView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 20.03.2025.
//

import SwiftUI

struct MeetingView: View {
    
    @State var scrumTimer: ScrumTimer = .init()
    
    @Binding var scrum: DailyScrum
   
    var body: some View {
        
        ZStack {
           
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            
            VStack {
                MeetingHeaderView(
                    secondsElapsed: scrumTimer.secondsElapsed,
                    secondsRemaning: scrumTimer.secondsRemaining,
                    theme: scrum.theme
                )
                
                
                Circle()
                    .strokeBorder(lineWidth: 24)
                
                MeetingFooterView(
                    speakers: scrumTimer.speakers,
                    skipAction: scrumTimer.skipSpeaker
                )
            }
        }
        .padding()
        .foregroundStyle(scrum.theme.accentColor)
        .onAppear {
            scrumTimer.reset(
                lengthInMunites: scrum.lengthInMinutes,
                attendees: scrum.attendees
            )
            scrumTimer.startScrum()
        }
        .onDisappear {
            scrumTimer.stopScrum()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
}
