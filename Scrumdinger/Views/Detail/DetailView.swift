//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 21.03.2025.
//

import SwiftUI

struct DetailView: View {
    
    @State private var isPresentingEditView: Bool = false
    
    @State private var editingScrum: DailyScrum = .emptyScrum
    
    @Binding var scrum: DailyScrum
    
    var body: some View {
        
        List {
            
            Section("Meeting Info") {
                NavigationLink(destination: MeetingView()) {
    
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundStyle(Color.accentColor)
                }
                
                HStack {
                    
                    Label("Length", systemImage: "clock")
                    
                    Spacer()
                    
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack {
                    
                    Label("Theme", systemImage: "paintpalette")
                    
                    Spacer()
                    
                    Text("\(scrum.theme.name)")
                        .padding(nameThemePadding)
                        .foregroundStyle(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(radius)
                }
                .accessibilityElement(children: .combine)
                
            }
            
            Section("Attendees") {
                
                ForEach(scrum.attendees) { attendee in
                   
                    Label(attendee.name, systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar {
            Button("Edit") {
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .sheet(isPresented: $isPresentingEditView) {
            
            NavigationStack {
                
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                isPresentingEditView = false
                                scrum = editingScrum
                            }
                        }
                    }
            }
        }
    }
    
    private let nameThemePadding: CGFloat = 4
    private let radius: CGFloat = 4
}

#Preview {
    NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[0]))
    }
}
