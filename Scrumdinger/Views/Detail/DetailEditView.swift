//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 21.03.2025.
//

import SwiftUI

struct DetailEditView: View {
    
    @Binding var scrum: DailyScrum
    
    @State private var newAttendeeName: String = ""
    
    var body: some View {
        
        Form {
            
            Section("Meeting Info") {
                
                TextField("Title", text: $scrum.title)
                
                HStack {
                    
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) munites")
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) munites")
                        .accessibilityHidden(true)
                    
                }
                
                ThemePicker(selection: $scrum.theme)
            }
            
            Section("Attendees") {
                
                ForEach(scrum.attendees) { attendee in
                    
                    Text(attendee.name)
                }
                .onDelete { indices in
                    scrum.attendees.remove(atOffsets: indices)
                }
                
                HStack {
                    
                    TextField("New Attendee", text: $newAttendeeName)
                    
                    Button {
    
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
                            scrum.attendees.append(attendee)
                            newAttendeeName = ""
                        }
                        
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
}
