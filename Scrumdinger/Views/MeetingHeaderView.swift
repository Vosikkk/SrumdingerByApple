//
//  MeetingHeaderView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 21.03.2025.
//

import SwiftUI

struct MeetingHeaderView: View {
    
    let secondsElapsed: Int
    let secondsRemaning: Int
    let theme: Theme
    
    var body: some View {
        
        VStack {
            
            ProgressView(value: progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme))
            
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    Text("Seconds Elapsed")
                        .font(.caption)
                    
                    Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaning)", systemImage: "hourglass.bottomhalf.fill")
                        .labelStyle(.trailingIcon)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
    }
    
    
    
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaning
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondsRemaning / 60
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaning: 180, theme: .bubblegum)
}
