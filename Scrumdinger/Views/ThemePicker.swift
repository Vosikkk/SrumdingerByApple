//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 21.03.2025.
//

import SwiftUI

struct ThemePicker: View {
    
    @Binding var selection: Theme
    
    var body: some View {
        
        Picker("Theme", selection: $selection) {
            
            ForEach(Theme.allCases) { theme in
                
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePicker(selection: .constant(.bubblegum))
}
