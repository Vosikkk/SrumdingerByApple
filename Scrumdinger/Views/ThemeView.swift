//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 21.03.2025.
//

import SwiftUI

struct ThemeView: View {
    
    let theme: Theme
    
    var body: some View {
        
        Text(theme.name)
            .padding(padding)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColor)
            .clipShape(RoundedRectangle(cornerRadius: radius))
    }
    
    private let radius: CGFloat = 4
    private let padding: CGFloat = 4
}

#Preview {
    ThemeView(theme: .buttercup)
}
