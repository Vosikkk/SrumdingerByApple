//
//  Theme.swift
//  Scrumdinger
//
//  Created by Саша Восколович on 20.03.2025.
//

import SwiftUI

enum Theme: String, CaseIterable, Identifiable, Codable {
    
    case bubblegum
    case buttercup
    case indigo1
    case lavender
    case magenta1
    case navy
    case orange1
    case oxblood
    case periwinkle
    case poppy
    case purple1
    case seafoam
    case sky
    case tan
    case teal1
    case yellow1
    
    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange1, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal1, .yellow1: return .black
        case .indigo1, .magenta1, .navy, .oxblood, .purple1: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        if rawValue.hasSuffix("1") {
           return rawValue.dropLast().capitalized
        }
        return rawValue.capitalized
    }
    
    var id: String {
        name
    }
}
